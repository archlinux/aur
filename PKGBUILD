# Maintainer: 910JQK <v910JQK@gmail.com>
_pkgname=gwankei
pkgname=$_pkgname-git
pkgver=r73.de43afb
pkgrel=3
pkgdesc='An implementation of Chinese board game Junqi, or Luzhanqi.'
arch=('i686' 'x86_64')
url='https://github.com/910JQK/GwanKei'
depends=('qt5-base' 'qt5-webkit' 'qt5-multimedia')
makedepends=('git' 'make' 'gcc')
provides=('gwankei')
source=('gwankei::git+https://github.com/910JQK/GwanKei.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	qmake
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -m755 -d "${pkgdir}/usr/bin/"
	install -m755 -d "${pkgdir}/usr/share/applications/"
	install -m755 -d "${pkgdir}/usr/share/pixmaps/"
	install -m755 -d "${pkgdir}/usr/share/gwankei/"
	cp -r Locale "${pkgdir}/usr/share/gwankei/Locale"
	cp -r Sound "${pkgdir}/usr/share/gwankei/Sound"
	chmod 644 -R "${pkgdir}/usr/share/gwankei/Locale"
	chmod 644 -R "${pkgdir}/usr/share/gwankei/Sound"
	chmod 755 "${pkgdir}/usr/share/gwankei/Locale"
	chmod 755 "${pkgdir}/usr/share/gwankei/Locale/"*/
	chmod 755 "${pkgdir}/usr/share/gwankei/Sound"
	chmod 755 "${pkgdir}/usr/share/gwankei/Sound/"*/
	install -m755 GwanKei "${pkgdir}/usr/share/gwankei/"
	install -m644 board.html "${pkgdir}/usr/share/gwankei"
	install -m644 frontend.js "${pkgdir}/usr/share/gwankei"
	cat << EOF > "${pkgdir}/usr/share/pixmaps/gwankei.svg"
<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 100 100">
  <rect x="5" y="20" width="90" height="60" stroke="black" stroke-width="6" fill="none">
  </rect>
  <text x="55" y="64" text-anchor="middle" fill="black" font-size="40" font-family="sans-serif">
    司令
  </text>
</svg>
EOF
	cat << EOF > "${pkgdir}/usr/share/applications/gwankei.desktop"
[Desktop Entry]
Version=0.01
Encoding=UTF-8
Name=Junqi
Name[zh_TW]=四國軍棋
Name[zh_CN]=四国军棋
Name[ja]=軍棋
Comment=Play Chinese board game Junqi with AI
Comment[zh_TW]=與 AI 對戰四國軍棋
Comment[zh_CN]=与 AI 对战四国军棋
Comment[ja]=中国のボードゲーム「軍棋」で遊ぶ
Exec=gwankei
Icon=gwankei
Categories=Application;Game
EOF
	cd "${pkgdir}/usr/bin"
	ln -s ../share/gwankei/GwanKei gwankei
	cd -
}
