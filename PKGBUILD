# Maintainer: Davide Polonio <davide+chituboxpro@poldebra.me>
# Contributor: Brian Li <brian14708@gmail.com>
# Contributor: Denys Zariaiev <denys.zariaiev@gmail.com>

pkgname=chitubox-pro-bin
pkgver=1.2.0

pkgrel=3
pkgdesc="All-in-one SLA/DLP/LCD Slicer - Pro version"

makedepends=('xdg-user-dirs')

url="https://www.chitubox.com/download.html"
arch=("x86_64")
license=("Commercial")

DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
ARCHIVE_NAME="CHITUBOX_Pro_LINUX_Installer_V${pkgver}.tar.gz"
DIR_NAME="CHITUBOX Pro V${pkgver}"

if [ ! -f ${PWD}/$ARCHIVE_NAME ]; then
	if [ -f $DOWNLOADS_DIR/$ARCHIVE_NAME ]; then
		ln -sfn $DOWNLOADS_DIR/$ARCHIVE_NAME ${PWD}
	else
		msg2 ""
		msg2 "Please download the archive with ChiTuBox Pro binaries v${pkgver} from https://www.chitubox.com/download.html"
		msg2 "You can either place it at '${PWD}/$ARCHIVE_NAME' or '$DOWNLOADS_DIR/$ARCHIVE_NAME'"
		msg2 ""
	fi
fi

options=(!strip)

source=(
    "local://$ARCHIVE_NAME"
    "local://chitubox-pro.desktop"
    "local://launcher"
)

sha256sums=(
    "64371ec873552a0c4e24d3cbc23b04de3bde24672996db0a41e8658e0df9e7d4"
    "1d1e4f69189696bf761cbb946055e66ece35c6c6e30949f85496755fe1680e01"
    "6af2f1c38490a2645f1c87c5aa84d098accd873014abd9437d6878e82a92fa8b"
)

noextract=("$ARCHIVE_NAME")

prepare() {
  mkdir "$DIR_NAME"
  bsdtar -x -C "$DIR_NAME" -f "${ARCHIVE_NAME}"
}

package()
{
    # binary data
    install -d "$pkgdir"/opt
    mv "${srcdir}/$DIR_NAME" "${pkgdir}/opt/chitubox-pro"

    # launcher
    install -d "$pkgdir"/usr/bin
    install -Dm755 launcher "$pkgdir"/usr/bin/chitubox-pro

    # desktop file
    install -Dm644 chitubox-pro.desktop "$pkgdir"/usr/share/applications/chitubox-pro.desktop
}
