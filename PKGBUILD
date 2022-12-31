# Maintainer: Martin Rys <rys.pw/contact>

# Previous maintainers:
#   Brian Li <brian14708@gmail.com>
#   Denys Zariaiev <denys.zariaiev@gmail.com>

pkgname=chitubox-free-bin
pkgver=1.9.4

pkgrel=4
pkgdesc="All-in-one SLA/DLP/LCD Slicer"

makedepends=(
	'xdg-user-dirs'
	'icoutils')

url="https://www.chitubox.com/download.html"
arch=("x86_64")
license=("Commercial")

DOWNLOADS_DIR=$(xdg-user-dir DOWNLOAD)
ARCHIVE_NAME="CHITUBOX_V${pkgver}.tar.gz"
DIR_NAME="CHITUBOX V${pkgver}"

if [ ! -f ${PWD}/$ARCHIVE_NAME ]; then
	if [ -f $DOWNLOADS_DIR/$ARCHIVE_NAME ]; then
		ln -sfn $DOWNLOADS_DIR/$ARCHIVE_NAME ${PWD}
	else
		msg2 ""
		msg2 "Please download the archive with ChiTuBox binaries v${pkgver} from https://www.chitubox.com/download.html"
		msg2 "You can either place it at '${PWD}/$ARCHIVE_NAME' or '$DOWNLOADS_DIR/$ARCHIVE_NAME'"
		msg2 ""
	fi
fi

options=(!strip)

source=(
	"local://$ARCHIVE_NAME"
	"local://chitubox-free.desktop"
	"local://launcher"
	"local://chitubox-free.xml"
)

sha256sums=(
	'c3131af2c0409759b8659f0e0b9a023bf65698245a9073051be5ff7082748e9b'
	'ef455760a0ed63b4f695fd5d999a338e6192e6fa9d4571791397cd5884c62c9f'
	'1144e0420568f0745aa6392d42c0fe0f496d18fb26e28c636bae45615180ec4e'
	'8bd846e6e12e293c8fe9a9c78e59658397dd078e1d697d72cda339ccd6ba06b2'
)

noextract=("$ARCHIVE_NAME")

prepare() {
  mkdir "$DIR_NAME"
  bsdtar -x -C "$DIR_NAME" -f "${ARCHIVE_NAME}"
	# Extract the included Windows ICO file into PNGs for each size
	icotool --extract "${DIR_NAME}/resource/ico/freeIcon.ico" --output "${DIR_NAME}/.."
}

package()
{
	# binary data
	install -d "$pkgdir"/opt
	mv "${srcdir}/$DIR_NAME" "${pkgdir}/opt/chitubox-free"

	# launcher
	install -d "$pkgdir"/usr/bin
	install -Dm755 launcher "$pkgdir"/usr/bin/chitubox-free

	# desktop file
	install -Dm644 chitubox-free.desktop "$pkgdir"/usr/share/applications/chitubox-free.desktop

	# icons
	install -Dm644 freeIcon_4_16x16x8.png    "$pkgdir"/usr/share/icons/hicolor/16x16/apps/chitubox-free.png
	install -Dm644 freeIcon_3_24x24x8.png    "$pkgdir"/usr/share/icons/hicolor/24x24/apps/chitubox-free.png
	install -Dm644 freeIcon_2_32x32x8.png    "$pkgdir"/usr/share/icons/hicolor/32x32/apps/chitubox-free.png
	install -Dm644 freeIcon_1_48x48x8.png    "$pkgdir"/usr/share/icons/hicolor/48x48/apps/chitubox-free.png
	install -Dm644 freeIcon_6_64x64x32.png   "$pkgdir"/usr/share/icons/hicolor/64x64/apps/chitubox-free.png
	install -Dm644 freeIcon_5_128x128x32.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/chitubox-free.png

	# mime/associations - see https://manual.chitubox.com/user-manual-pro/requirements/
	install -Dm644 chitubox-free.xml "$pkgdir"/usr/share/mime/packages/chitubox-free.xml
}
