# Maintainer: bserckx <services+aur@brechtserckx.be>
# Contributor: Philipp A. <flying-sheep@web.de>
# Contributor: theSander <aur@sandervanbalen.be>
pkgname=hamsket-git
pkgver=r1133.433cadb
pkgrel=1
pkgdesc="Free and Open Source messaging and emailing app that combines common web applications into one."
arch=(i686 x86_64)
url="https://github.com/TheGoddessInari/hamsket"
license=('GPL3')
depends=(electron)
makedepends=('java-runtime=8' 'git' 'desktop-file-utils' 'ruby' 'npm' 'sencha-cmd-6')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "rambox" "rambox-bin" "rambox-os" "rambox-os-git" "ramboxpro-bin" "hamsket-bin")
replaces=("rambox-os-git")
backup=()
options=()
install=
source=(
  'hamsket::git+https://github.com/TheGoddessInari/hamsket.git'
  "${pkgname%-git}.desktop"
)
noextract=()
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  # Get electron version from pacman
  ev="$(pacman -Q electron | cut -d " " -f2 | cut -d "-" -f1)"
  # Insert electron version in package.json
  sed -i -re "s/^(\s+\"electron\": \")[^\"]+(\",)/\1$ev\2/" package.json
  sed -i -re "s/^(\s*)(\"build\":\s*\{$)/\1\2\n\1\t\"electronVersion\": \"$ev\",/m" package.json
}

build() {
  # get jdk 8
  if [ ! -z "$(archlinux-java get | grep 8)" ]; then
    _JDK="$(archlinux-java get)"
  else
    _JDK=$(archlinux-java status |
      grep java | grep 8 |
      sed -e 's/^[[:space:]]*//' | cut -d "/" -f1 |
      head -n1)
  fi

  # build
  cd "$srcdir/${pkgname%-git}"
  npm install --cache "${srcdir}/npm-cache"
  # build with a jdk 8
  env PATH="/usr/lib/jvm/$_JDK/jre/bin/:$PATH" npm run repack:linux64
}

package() {
  install -d "$pkgdir/usr/lib"
  install -d "$pkgdir/usr/bin"

  cp -r "$srcdir/${pkgname%-git}/dist/linux-unpacked" "$pkgdir/usr/lib/${pkgname%-git}"

  install -Dm644 "$srcdir/${pkgname%-git}/resources/Icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  ln -s "/usr/lib/${pkgname%-git}/hamsket" "${pkgdir}/usr/bin/${pkgname%-git}"
  desktop-file-install "$srcdir/${pkgname%-git}.desktop" --dir "$pkgdir/usr/share/applications/"
}
