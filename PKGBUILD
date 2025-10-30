# Maintainer : kStor2poche <kStor2poche [at] orange [dot] fr>

_pkgname='nautilus-raw-thumbnails'
pkgname="${_pkgname}-git"
pkgrel=1
pkgdesc='Preview RAW files in Nautilus (a.k.a. Gnome Files)'
pkgver='r16.74dc75b'
arch=('any')
url="https://github.com/emuskardin/$_pkgname"

depends=(
    'nautilus'
    'bash'
    'exiv2'
    'imagemagick'
    'perl-image-exiftool'
)
# conflicts=("${_pkgname}") # in case the non-git package ever exists
# provides=("${_pkgname}=${pkgver}")
source=(
    "git+$url.git"
    'exiv2raw.thumbnailer.patch'
)
b2sums=(
    'SKIP'
    '03bfef5222e7b8cbcfb2dde81be42551f40873bc57ea2fbc00e88e31a25438163fcfde48c2970e0acf57ffbf3c0bc604e124a63e490658dbce77356aa32003f1'
)
install="${_pkgname}.install"

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${_pkgname}"
    patch -N -i "${srcdir}/exiv2raw.thumbnailer.patch" "exiv2raw.thumbnailer"
}

package() {
	cd "$_pkgname"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    install -Dm 644 "exiv2raw.thumbnailer" -t "${pkgdir}/usr/share/thumbnailers/"
    install -Dm 755 "exiv2-thumbnailer.sh" -t "${pkgdir}/usr/bin/"
}
