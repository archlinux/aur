# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>
# Contributor: swearchnick <swearchnick at gmail dot com>

_pkgbase=tbs-linux_media-git
pkgname=${_pkgbase}-dkms
pkgver=r20200602.162918.d0a9dd9442
pkgrel=1
pkgdesc="TBS linux open source drivers (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/tbsdtv/linux_media"
license=('GPL2')
makedepends=('git')
depends=('dkms' 'patchutils' 'perl-proc-processtable')
conflicts=("${_pkgbase}" 'tbs-dvb-drivers')
provides=("${_pkgbase}" 'linux_media')
source=('dkms.conf'
        'modules.list'
        'media_build::git+https://github.com/tbsdtv/media_build.git')
sha256sums=('29080dcf03d7229358a8e5a7690dc3d4cd7bcbb7535e3a8370dfeaef6721a70d'
            '195c6a971c915855ab4e39cfd4d7ae14b513fbb7c8daa5b3e5135cc5b50ba81c'
            'SKIP')
options=('!strip')

prepare() {
    if [ -d "${srcdir}/media" ]; then
        cd "${srcdir}/media" && \
        git fetch --depth=1 origin && \
        git reset --hard origin/latest
    else
        git clone --depth=1 https://github.com/tbsdtv/linux_media.git -b latest "$srcdir/media"
    fi
}

pkgver() {
    cd "$srcdir/media"
    printf "r%s.%s" "$(git show -s --date=format:'%Y%m%d.%H%M%S' --format=%cd)" "$(git rev-parse --short HEAD)"
}

package() {
    # Copy dkms.conf
    install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    # Append module list
    cat "${srcdir}/modules.list" >> "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    # Copy sources
    mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/media/"
    cp -r "${srcdir}/media"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/media/"

    mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/media_build/"
    cp -r "${srcdir}/media_build"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/media_build/"
}
