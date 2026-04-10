# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: richteer <richteer at lastprime.net>

pkgname=profanity-git
pkgver=7904.89fce43c0
pkgrel=1
pkgdesc="A console based jabber client."
arch=('i686' 'x86_64')
url="http://profanity-im.github.io"
license=('GPL3')
depends=('curl' 'expat' 'libgcrypt' 'libnotify' 'libotr' 'libxss' 'libsignal-protocol-c'
          'gpgme' 'libstrophe-git')
makedepends=('git' 'meson')
provides=('profanity')
conflicts=('profanity')
source=("git+https://github.com/profanity-im/profanity.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${pkgname%-git}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  local meson_options=(
    -D icons-and-clipboard=enabled
    -D xscreensaver=enabled
    -D notifications=enabled
    -D python-plugins=enabled
    -D c-plugins=enabled
    -D otr=enabled
    -D omemo=enabled
    -D pgp=enabled
  )

  arch-meson ${pkgname%-git} build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

