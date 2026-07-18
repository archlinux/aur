# Maintainer: Jakob Munch Overgaard <jmo@tvipper.com>
pkgname=remotepower-server
pkgver=6.2.3
pkgrel=1
pkgdesc='Self-hosted fleet-management server for RemotePower (nginx + gunicorn/Flask): dashboards, CVE/drift/compliance, monitoring, AI'
arch=('any')
url='https://github.com/tyxak/remotepower'
license=('MIT')
# Hard deps are all in the official repos. The two AUR-only Python libs
# (webauthn, pysaml2) are optdepends so they never block a plain install.
depends=('nginx' 'python' 'python-bcrypt' 'python-cryptography' 'python-dnspython'
         'python-flask' 'python-pydantic' 'gunicorn' 'iputils')
optdepends=(
  'python-reportlab: PDF report export'
  'python-webauthn: passkey / WebAuthn MFA (AUR)'
  'python-pysaml2: SAML SSO (AUR)'
  'xmlsec: SAML signature verification (pairs with python-pysaml2)'
  'wireguard-go: WG Access road-warrior VPN hub (Admin -> WG Access)'
  'wireguard-tools: WG Access — wg/wg-quick used by the VPN hub helper'
  'python-psycopg: PostgreSQL storage backend for large / multi-node fleets'
  'postgresql: PostgreSQL storage backend for large / multi-node fleets'
)
backup=('etc/nginx/snippets/remotepower-locations.conf')
install="$pkgname.install"
# Built from the signed GitHub release tarball, PGP-verified against the
# maintainer key (the .asc that `make release` produces).
source=(
  "remotepower-$pkgver.tar.gz::$url/releases/download/v$pkgver/remotepower-$pkgver.tar.gz"
  "remotepower-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/remotepower-$pkgver.tar.gz.asc"
)
sha256sums=(
  '9eaa1e78c1345b4024dab857892584876fbc45002b959e8ece1bdfdfa89f5981'
  'SKIP'
)
validpgpkeys=('E7B5AD456728B8462A8B54BFD488AF115D2CCDBF')  # Jakob Munch Overgaard <jmo@tvipper.com>

package() {
  cd "remotepower-$pkgver"
  local web="$pkgdir/var/www/remotepower"
  install -dm755 "$web/cgi-bin" "$web/agent" "$web/static" "$web/docs"

  # ── Backend: cgi-bin Python. The app server entry point is wsgi.py, a real
  #    Flask app served by gunicorn (the only server — CGI/fcgiwrap is retired).
  #    api.py stays +x too (still directly runnable + imported by the
  #    siblings); the rest are imported modules. compileall runs in .install. ──
  local f n
  for f in server/cgi-bin/*.py; do
    n=$(basename "$f")
    if [ "$n" = 'api.py' ] || [ "$n" = 'wsgi.py' ]; then
      install -m755 "$f" "$web/cgi-bin/$n"
    else
      install -m644 "$f" "$web/cgi-bin/$n"
    fi
  done
  [ -f server/cgi-bin/remotepower-tls-check ] && \
    install -m755 server/cgi-bin/remotepower-tls-check "$web/cgi-bin/remotepower-tls-check"

  # Admin/user management tool + a convenience wrapper on PATH.
  install -m755 server/remotepower-passwd "$web/cgi-bin/remotepower-passwd"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /var/www/remotepower/cgi-bin/remotepower-passwd "$pkgdir/usr/bin/remotepower-passwd"

  # ── Frontend: html, PWA assets, static, docs, manual ──
  install -m644 server/html/*.html "$web/"
  for f in server/html/favicon.* server/html/robots.txt server/html/manifest.json server/html/sw.js; do
    [ -f "$f" ] && install -m644 "$f" "$web/$(basename "$f")"
  done
  cp -r server/html/static/. "$web/static/"
  find "$web/static" -type d -exec chmod 755 {} +
  find "$web/static" -type f -exec chmod 644 {} +
  install -m644 docs/*.md   "$web/docs/" 2>/dev/null || true
  install -m644 docs/*.html "$web/docs/" 2>/dev/null || true

  # Agent binary, served read-only for agent self-update (/api/agent/download).
  install -m755 client/remotepower-agent "$web/agent/remotepower-agent"
  # v6.2.0: Windows + macOS agents, served at /api/agent/{win,mac}/download —
  # the Windows /install.ps1 one-liner and cross-platform self-update need them.
  install -m644 client/remotepower-agent-win.py "$web/agent/remotepower-agent-win.py"
  install -m644 client/remotepower-agent-mac.py "$web/agent/remotepower-agent-mac.py"

  # ── WG Access (v5.2.0): root-owned privileged helper + scoped sudoers. The app
  #    server runs unprivileged and shells out to this one script (argv-only JSON
  #    spec) via a NOPASSWD rule for the nginx user (http). wireguard-go is an optdepend;
  #    until it's installed the WG Access page just shows an "unavailable" notice. ──
  install -Dm755 packaging/remotepower-wg-apply \
    "$pkgdir/usr/local/sbin/remotepower-wg-apply"
  install -dm750 "$pkgdir/etc/sudoers.d"
  printf 'http ALL=(root) NOPASSWD: /usr/local/sbin/remotepower-wg-apply\n' \
    > "$pkgdir/etc/sudoers.d/remotepower-wg"
  chmod 440 "$pkgdir/etc/sudoers.d/remotepower-wg"

  # ── "Restart server" helper (v6.1.2): same single-script NOPASSWD model. The
  #    app server runs this one root-owned script to `systemctl restart` itself;
  #    it grants no privilege the admin doesn't already have via self-update. ──
  install -Dm755 packaging/remotepower-server-restart.sh \
    "$pkgdir/usr/local/sbin/remotepower-server-restart"
  printf 'http ALL=(root) NOPASSWD: /usr/local/sbin/remotepower-server-restart\n' \
    > "$pkgdir/etc/sudoers.d/remotepower-self-restart"
  chmod 440 "$pkgdir/etc/sudoers.d/remotepower-self-restart"

  # ── nginx: shared locations snippet (works as-is with /var/www/remotepower). ──
  install -Dm644 server/conf/remotepower-locations.conf \
    "$pkgdir/etc/nginx/snippets/remotepower-locations.conf"
  # Sample vhost + backend units → docs (user sets server_name/TLS, then copies
  # remotepower-wsgi.service into place per the .install post_install message —
  # the app server, not optional). See docs/wsgi.md, docs/scaling.md.
  install -Dm644 server/conf/remotepower.conf \
    "$pkgdir/usr/share/doc/$pkgname/remotepower.conf.sample"
  install -Dm644 server/conf/remotepower-wsgi.service \
    "$pkgdir/usr/share/doc/$pkgname/remotepower-wsgi.service"
  install -Dm644 server/conf/remotepower-scheduler.service \
    "$pkgdir/usr/share/doc/$pkgname/remotepower-scheduler.service"

  # ── Data dir, created + owned by the nginx user (http) at install/boot. ──
  install -dm755 "$pkgdir/usr/lib/tmpfiles.d"
  printf 'd /var/lib/remotepower 0700 http http -\n' \
    > "$pkgdir/usr/lib/tmpfiles.d/remotepower.conf"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
