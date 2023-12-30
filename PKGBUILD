# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: KosmX <kosmx.mc@gmail.com>
_canonical_name=lxd-ui

pkgname=incus-ui-canonical
pkgver=0.5
pkgrel=1
epoch=
pkgdesc="lxd-ui rebranded to incus"
arch=('i686' 'x86_64')
url=""
license=('GPL3')
depends=('incus')
makedepends=('yarn' 'npm' 'rsync')
changelog=
source=("git+https://github.com/zabbly/incus.git"
        "https://github.com/canonical/lxd-ui/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=(
    'SKIP'
    'b9e2f8a486d5b8b1155895f7339319b907540bc6c50c76e86bde7f8a00f669ee'
)
noextract=()
validpgpkeys=()

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
	cd "$_canonical_name-$pkgver"

    mkdir -p "$pkgdir/opt/incus/ui-canonical/"
    rsync -a build/ui/ "$pkgdir/opt/incus/ui-canonical/"
}
