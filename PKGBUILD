# Maintainer: KosmX <kosmx dot mc at gmail dot com>
_canonical_name=lxd-ui

pkgname=incus-ui-canonical
pkgver=0.6
pkgrel=1
epoch=
pkgdesc="lxd-ui rebranded to incus"
arch=('i686' 'x86_64')
url="https://github.com/KosmX/incus-ui-canonical-arch" # There is no definite upstream for this.
license=('GPL3')
depends=('incus')
makedepends=('git' 'yarn' 'npm' 'rsync')
changelog=
source=("git+https://github.com/zabbly/incus.git"
        "https://github.com/canonical/lxd-ui/archive/refs/tags/${pkgver}.tar.gz"
        "incus.service"
)
sha256sums=(
    'SKIP'
    '427349b215fe1cf314d5b795e6ccc139e191327ec41f473b517ef2c7800f1282'
    '760c221d5105eae80665fa48d4195b0e6bf2b72106cb03d8eea9e4ffafa81411'
)
noextract=()
validpgpkeys=()
backup=('etc/systemd/system/incus.service')

prepare() {
    REPO="${PWD}"/incus

    #https://github.com/zabbly/incus/blob/75f9f3de023f13d1d54e133fb2ea60de8a0c3006/.github/workflows/builds.yml#L306
    cd "$_canonical_name-$pkgver"
    
    git apply -p1 < "${REPO}/patches/ui-canonical-0001-Branding.patch"
    patch -p1 -i "${REPO}/patches/ui-canonical-0002-Update-navigation.patch"
    patch -p1 -i "${REPO}/patches/ui-canonical-0003-Update-certificate-generation.patch"
    patch -p1 -i "${REPO}/patches/ui-canonical-0004-Remove-external-links.patch"
    patch -p1 -i "${REPO}/patches/ui-canonical-0005-Remove-Canonical-image-servers.patch"

    # Generic renaming
    sed -i "s/LXD/Incus/g" src/*/*.ts* src/*/*/*.ts* src/*/*/*/*.ts*
    sed -i "s/devlxd/guestapi/g" src/*/*.ts* src/*/*/*.ts* src/*/*/*/*.ts*
    sed -i "s/dev\/lxd/dev\/incus/g" src/*/*.ts* src/*/*/*.ts* src/*/*/*/*.ts*
    sed -i "s/lxd_/incus_/g" src/*/*.ts* src/*/*/*.ts* src/*/*/*/*.ts*
    sed -i "s/\"lxd\"/\"incus\"/g" src/*/*.ts* src/*/*/*.ts* src/*/*/*/*.ts*
}

build() {
    cd "$_canonical_name-$pkgver"
    yarn install
    yarn build
}


package() {
    pushd "$_canonical_name-$pkgver"

    mkdir -p "$pkgdir/opt/incus/ui-canonical/"
    rsync -a build/ui/ "$pkgdir/opt/incus/ui/"
    popd
    mkdir -p "$pkgdir/etc/systemd/system/"
    cp incus.service "$pkgdir/etc/systemd/system/"
}
