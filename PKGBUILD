# Maintainer: Kye Hunter <kye(dot)evan(dot)hunter(at)gmail(dot)com>
# Contributer: Lukas Innig <lukas(dot)innig(at)gmail(dot)com>

pkgname=snd-hda-macbookpro-dkms-git
pkgver=0.1.r84.g89b22ff
pkgver() {
    cd "${srcdir}/snd_hda_macbookpro"

    local version
    version=$(sed -nr '/PACKAGE_VERSION/s/^.*="(.*)"$/\1/p' dkms.conf)
    printf '%s.r%s.g%s' \
        "$version" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}
pkgrel=1
pkgdesc="Kernel driver for sound on Macs with Cirrus 8409 HDA chips"
arch=(any)
url="https://github.com/davidjo/snd_hda_macbookpro"
license=('GPL-2.0-only')
install='snd_hda_macbookpro.install'
depends=(
    'git'
    'gcc'
    'make'
    'patch'
    'wget'
    'dkms'
)
makedepends=()
source=('git+https://github.com/davidjo/snd_hda_macbookpro.git')
sha256sums=('SKIP')

package() {
    local dkmsver
    dkmsver=$(sed -nr '/PACKAGE_VERSION/s/^.*="(.*)"$/\1/p' \
        "${srcdir}/snd_hda_macbookpro/dkms.conf")

    for file in $(ls -p ${srcdir}/snd_hda_macbookpro | grep -v '/$') ; do
        install -D -m0644 -t \
            "${pkgdir}"/usr/src/snd-hda-macbookpro-${dkmsver} \
            ${srcdir}/snd_hda_macbookpro/"$file"
    done
    for file in $(ls -p ${srcdir}/snd_hda_macbookpro/makefiles | grep -v '/$') ; do
        install -D -m0644 -t \
            "${pkgdir}"/usr/src/snd-hda-macbookpro-${dkmsver}/makefiles \
            ${srcdir}/snd_hda_macbookpro/makefiles/"$file"
    done
    for file in $(ls -p ${srcdir}/snd_hda_macbookpro/patches | grep -v '/$') ; do
        install -D -m0644 -t \
            "${pkgdir}"/usr/src/snd-hda-macbookpro-${dkmsver}/patches \
            ${srcdir}/snd_hda_macbookpro/patches/"$file"
    done
    for file in $(ls -p ${srcdir}/snd_hda_macbookpro/patch_cirrus | grep -v '/$') ; do
        install -D -m0644 -t \
            "${pkgdir}"/usr/src/snd-hda-macbookpro-${dkmsver}/patch_cirrus \
            ${srcdir}/snd_hda_macbookpro/patch_cirrus/"$file"
    done
    install -D -m0755 -t \
        "${pkgdir}"/usr/src/snd-hda-macbookpro-${dkmsver} \
        "${srcdir}/snd_hda_macbookpro/install.cirrus.driver.sh"
    install -D -m0755 -t \
        "${pkgdir}"/usr/src/snd-hda-macbookpro-${dkmsver} \
        "${srcdir}/snd_hda_macbookpro/install.cirrus.driver.pre617.sh"
}
