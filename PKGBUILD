# Maintainer: Your Name <alberto.diazdorado@tngtech.com>
# Maintainer: Nicholas Schwab <nicholas.schwab@tngtech.com>
pkgname=please-cli
pkgver=0.3.0
pkgrel=1
pkgdesc='An AI helper script to create CLI commands.'
arch=('any')
license=('Apache')
depends=('bash' 'jq' 'curl')
optdepends=('libsecret: store OpenApi key in keychain'
    'xclip: copy command to clipboard on X'
    'wl-clipboard: copy command to clipboard on Wayland')
makedepends=('sed' 'git')
install="${pkgname}.install"
source=('git+https://github.com/TNG/please-cli.git')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  if [ -z "$VERSION" ]; then
    _tag=$(git tag --sort=v:refname | tail -n1)
    printf '%s.r%s.g%s' "${_tag#v}" "$(git rev-list "$_tag"..HEAD --count)" "$(git rev-parse --short HEAD)"
  else
    printf "$VERSION"
  fi
}

prepare() {
  cd "$pkgname"

  if [ -n "$VERSION" ]; then
    # Make specific version instead
    git checkout "release/v${VERSION}"
  fi

  # Patching the install command in an error message.
  sed -i -e 's/sudo apt install libsecret-tools/sudo pacman -S libsecret/' 'please.sh'
}

package() {
  cd "$pkgname"

  install -m 755 -DT 'please.sh' "${pkgdir}/usr/bin/please"
}
