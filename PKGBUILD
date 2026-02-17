# Maintainer: Matt Cuneo <m@cuneo.au>
_repo=platform
pkgbase="authentik-platform-git"
pkgname=('authentik-cli-git' 'authentik-agent-git' 'authentik-sysd-git' 'authentik-pam-git' 'authentik-nss-git' 'authentik-browser-support-git')
pkgver=r886.34fc781a
pkgrel=1
pkgdesc='Authentik platform tools'
arch=('x86_64')
url="https://github.com/goauthentik/$_repo"
license=('AGPL3')
makedepends=(git go rust)
options=(!lto)
source=(
  "$_repo::git+$url.git"
  authentik-nss.install
  authentik-pam.install
  authentik-sysd.install
)
b2sums=('SKIP'
        '6d51a800f7f20d69845a91d946925df143ca00c5d8f465c6d34e4ea617d9872c869e557086b6d0e38ebb3cbd5f61219e4f34dd03f58c586f6d32eb0cb37292ed'
        'a67cc07a0e5d60e9aa2c23f86bbc6a028d4a2134ba53ea2b8b08e2cc046b29dc42e9d18fa63b5cf1738590bcb3998c34b672361ee354ed6f3c5cc92e73fcf7cd'
        'a98da09ebfd7493d1dc42419508835a40c79306d636f05eac62cef51db235a4021d0a39755a71dc4621aa8b7922fe08c59c29f1866a289e06068aea07d3c48e8')
pkgver() {
  cd "$_repo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  for path in cmd/{agent_system,agent_local,cli,browser_support} nss pam; do
    cd "$srcdir/$_repo/$path"
    make build
  done
  for tgt in cli agent_system; do
    mkdir -p "$srcdir/$_repo/bin/$tgt/completions"
    "$srcdir/$_repo/hack/completions.sh" "$srcdir/$_repo/cmd/$tgt" "$srcdir/$_repo/bin/$tgt/completions" $tgt
  done
}

package_authentik-browser-support-git() {
  provides=(authentik-browser-support)
  conflicts=(authentik-browser-support)
  cd "$_repo/bin/browser_support"
  install -Dm755 ak-browser-support "$pkgdir/usr/bin/ak-browser-support"
}

package_authentik-sysd-git() {
  depends=(authentik-browser-support authentik-agent)
  optdepends=(
    'authentik-nss: Make the system aware of Authentik users'
    'authentik-pam: Allow logging in as an Authentik user'
  )
  provides=(authentik-sysd)
  conflicts=(authentik-sysd)
  backup=(etc/authentik/config.json)
  cd "$_repo/bin/agent_system"
  install -Dm755 ak-sysd "$pkgdir/usr/bin/ak-sysd"
  install -Dm644 "$srcdir/$_repo/cmd/agent_system/package/linux/usr/lib/systemd/system/ak-sysd.service" "$pkgdir/usr/lib/systemd/system/ak-sysd.service"
  install -Dm644 "$srcdir/$_repo/cmd/agent_system/package/linux/config.json" "$pkgdir/etc/authentik/config.json"
  install -Dm755 completions/agent_system.bash "$pkgdir/usr/share/bash-completion/completions/ak-sysd"
  install -Dm755 completions/agent_system.fish "$pkgdir/usr/share/fish/completions/ak-sysd.fish"
  install -dm755 "$pkgdir/etc/authentik/domains"
  install -dm755 "$pkgdir/var/lib/authentik"
  install -Dm644 "$srcdir/$_repo/cmd/agent_system/package/linux/browser-host-chrome.json" "$pkgdir/opt/google/chrome/native-messaging-hosts/io.goauthentik.platform.json"
  install -Dm644 "$srcdir/$_repo/cmd/agent_system/package/linux/browser-host-firefox.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/io.goauthentik.platform.json"

}

package_authentik-agent-git() {
  depends=(authentik-cli)
  provides=(authentik-agent)
  conflicts=(authentik-agent)
  cd "$_repo/bin/agent_local"
  install -Dm755 ak-agent "$pkgdir/usr/bin/ak-agent"
  install -Dm644 "$srcdir/$_repo/cmd/agent_local/package/linux/etc/systemd/user/ak-agent.service" "$pkgdir/usr/lib/systemd/user/ak-agent.service"
  install -Dm644 "$srcdir/$_repo/cmd/agent_local/package/linux/usr/share/polkit-1/actions/io.goauthentik.platform.policy" "$pkgdir/usr/share/polkit-1/actions/io.goauthentik.platform.policy"
}

package_authentik-cli-git() {
  provides=(authentik-cli)
  conflicts=(authentik-cli)
  pkgdesc="authentik CLI"
  cd "$_repo/bin/cli"
  install -Dm755 ak "$pkgdir/usr/bin/ak"
  install -Dm755 completions/cli.bash "$pkgdir/usr/share/bash-completion/completions/ak-cli"
  install -Dm755 completions/cli.fish "$pkgdir/usr/share/fish/completions/ak-cli.fish"
}

package_authentik-nss-git() {
  depends=(authentik-sysd)
  provides=(authentik-nss)
  conflicts=(authentik-nss)
  pkgdesc="Authentik nss module that makes the system aware of Authentik users"
  install=authentik-nss.install
  cd "$_repo/cache/nss/release"
  install -Dm644 libauthentik_nss.so "$pkgdir/usr/lib/libnss_authentik.so.2"
}

package_authentik-pam-git() {
  depends=(authentik-sysd)
  provides=(authentik-pam)
  conflicts=(authentik-pam)
  pkgdesc="Authentik PAM module to enable logging in with Authentik credentials"
  install=authentik-pam.install
  cd "$_repo/cache/pam/release"
  install -Dm644 libauthentik_pam.so "$pkgdir/usr/lib/security/pam_authentik.so"
}
