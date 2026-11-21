# Maintainer: lukerb52
# Add a maintainer contact address before submitting to the AUR.
# Publication blocker: upstream must declare a license (see README.md).
pkgname=goatak-setup-archbased-git
pkgver=r9.d3caaac
pkgrel=1
pkgdesc='Interactive GoATAK setup and HTTPS enrollment helper for Arch-based Linux'
arch=('any')
url='https://github.com/lukerb52/goatak-setup-archbased'
license=('LicenseRef-Unspecified')
depends=(
  'bash'
  'coreutils'
  'curl'
  'grep'
  'iproute2'
  'openssl'
  'procps-ng'
  'python'
  'sed'
  'util-linux'
  'zip'
  'goatak'
)
makedepends=('git')
optdepends=(
  'sudo: privilege escalation (sudo or opendoas is required)'
  'opendoas: alternative privilege escalation'
  'nginx: local HTTPS enrollment reverse proxy'
  'openssh: copy generated configuration to a remote Nginx host'
  'wireguard-tools: optional private transport to a remote proxy'
  'ufw: optional firewall configuration'
  'firewalld: optional firewall configuration'
  'runit: service management on runit-based systems'
)
provides=('goatak-setup-archbased')
conflicts=('goatak-setup-archbased')
source=("goatak-setup-archbased::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/goatak-setup-archbased"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$srcdir/goatak-setup-archbased"
  bash -n goatak-setup.sh
  bash goatak-setup.sh --help
}

package() {
  cd "$srcdir/goatak-setup-archbased"
  install -Dm755 goatak-setup.sh "$pkgdir/usr/bin/goatak-setup"

  local doc
  for doc in README.md REMOTE-NGINX-EXAMPLE.md; do
    install -Dm644 "$doc" "$pkgdir/usr/share/doc/${pkgname}/${doc}"
  done
  # Preserve the documented checkout command and generated-guide commands.
  ln -s goatak-setup "$pkgdir/usr/bin/goatak-setup.sh"

  # Install an upstream license when one has been declared and committed.
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
