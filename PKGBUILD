# Maintainer: 
# Contributor: RealStickman <mrc+aur@frm01.net>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Muflone http://www.muflone.com/contacts/english/
pkgname=cpu-g-git
pkgver=0.16.3.1ubuntu1.r83.83a9942
pkgrel=1
pkgdesc="Shows useful information about your computer"
arch=('any')
url="https://github.com/atareao/cpu-g"
license=('GPL3')
depends=(
  'gtk3'
  'mesa-utils'
  'pciutils'
  'procps-ng'
  'python-distro'
  'python-dbus'
  'python-cairocffi'
  'python-gobject'
  'python-matplotlib'
  'python-psutil'
  'upower'
  'wmctrl'
)
makedepends=('dpkg' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/atareao/cpu-g.git"
        'ubuntu_to_arch.patch')
sha256sums=('SKIP'
            '45d106456f21b28a7d206aa78f00876b27d544e584098691da2c01944fe2b01e')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s.r%s.%s" "$(dpkg-parsechangelog --show-field Version | sed 's/-/./')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch -p1 -i "${srcdir}/ubuntu_to_arch.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  for _file in po/*.po; do
    msgfmt "${_file//.po}" -o "${_file//.po}.mo"
  done
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 "bin/${pkgname%-git}" -t "$pkgdir/usr/share/${pkgname%-git}"
  install -Dm644 src/*.py -t "$pkgdir/usr/share/${pkgname%-git}/src"
  install -Dm644 debian/changelog -t "$pkgdir/usr/share/${pkgname%-git}"
  install -Dm644 "data/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "data/icons/${pkgname%-git}.png" -t "$pkgdir/usr/share/${pkgname%-git}/data/icons"
  install -Dm644 data/logos/*.png -t "$pkgdir/usr/share/${pkgname%-git}/data/logos"
  install -Dm644 data/distros/*.png -t "$pkgdir/usr/share/${pkgname%-git}/data/distros"
  install -Dm644 data/graphic_card/*.png -t "$pkgdir/usr/share/${pkgname%-git}/data/graphic_card"

  for _size in 14 64 192; do
    install -Dm644 "data/icons/${pkgname%-git}_${_size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname%-git}.png"
  done

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/${pkgname%-git}/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"

  cd po
  for _file in *.mo; do
    install -Dm644 "${_file}" \
      "$pkgdir/usr/share/locale/${_file//.mo}/LC_MESSAGES/${pkgname%-git}.mo"
  done
}
