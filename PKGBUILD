# Maintainer: Sunny <sunnyiez@hotmail.com>
# I cloned some codes from package hon. Thanks to the maintainer. 

# To speed up package creation. If you are planning to distribute
# This on some custon repo, you might want to use the defaut slow but
# much better xz compression.
PKGEXT=.tar.gz

pkgname=strife
pkgver=0.9.4.3
pkgrel=1
pkgdesc="Strife"
arch=('i686' 'x86_64')
url="https://strife.com"
license=('custom:strife')
depends=('alsa-lib' 'gconf' 'gtk2'  'nss' 'libxss' 'libxtst' 'libtxc_dxtn')
makedepends=('tar' 'gzip')
options=(!strip)
install=strife.install

platform=""
if test "$CARCH" == x86_64; then
	platform=64
fi

source=("http://dl.strife.com/af1dfc2754268375727a3eec1749b27e/StrifeLinux${platform}-${pkgver}.tar.gz")
[[ "$CARCH" = 'x86_64' ]] && md5sums=('e19909d82a6df83ee7a069f24db30a13')
[[ "$CARCH" = 'i686' ]] && md5sums=('71151bead16afa31a0913b7ef5389e44')

package() {
    ## Thx to messo8080 for reminding us about the /tmp dir,
    ## on new installs this dir is in ram by default.

    if `pwd | grep -q "/tmp"`; then
	echo \
"You are trying to build this pkg in /tmp dir.
This is not so good idea as /tmp dir is in ram
by default. If you know that you have lots of
ram (>4G) and swap and want to continue building in
the current directory write yes and press ENTER.
Otherwise write no and press ENTER.
Continue?"
	read answer
		if [ "${answer}" == "no" ]; then
			false
		fi
    fi
    # Create Destination Directory
	mkdir -p "${pkgdir}/opt/"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

    # Extract Files
	cp -r "${srcdir}/Strife" "${pkgdir}/opt/strife"

    # Install License
	cp "${srcdir}/Strife/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp "${srcdir}/Strife/tos_en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp "${srcdir}/Strife/tos_ru.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp "${srcdir}/Strife/tos_th.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp "${srcdir}/Strife/tos_zh.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp "${srcdir}/Strife/tos.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"

    # Fixed a problem preventing strife to start on Arch Linux 
	mv "${pkgdir}/opt/strife/bin/libgpg-error.so.0" "${pkgdir}/opt/strife/bin/libgpg-error.so.0.bk"

    # Install Desktop Shortcut
	touch "${srcdir}/strife.desktop"
	echo "[Desktop Entry]" > "${srcdir}/strife.desktop"
	echo "Encoding=UTF-8" >> "${srcdir}/strife.desktop"
	echo "Name=Strife" >> "${srcdir}/strife.desktop"
	echo "GenericName=Strife" >> "${srcdir}/strife.desktop"
	echo "Comment=Second generation MOBA created by S2 Games" >> "${srcdir}/strife.desktop"
	echo "Exec=/usr/bin/strife" >> "${srcdir}/strife.desktop"
	echo "Icon=/opt/strife/icon.png" >> "${srcdir}/strife.desktop"
	echo "StartupNotify=true" >> "${srcdir}/strife.desktop"
	echo "Terminal=false" >> "${srcdir}/strife.desktop"
	echo "Type=Application" >> "${srcdir}/strife.desktop"
	echo "Categories=Application;Game;" >> "${srcdir}/strife.desktop"

	install -D -m 0644 "${srcdir}/strife.desktop" \
        "${pkgdir}/usr/share/applications/strife.desktop"


    # Install Client Launcher
	mkdir -p "${pkgdir}/usr/bin"
	ln -s /opt/strife/bin/strife "${pkgdir}/usr/bin/strife"

    # Set Ownership to root:games
	chown -R root:games "${pkgdir}/opt/strife"
	chmod -R g+w "${pkgdir}/opt/strife"
}
