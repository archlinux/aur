# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
pkgname=rocm-bin-extras
pkgdesc="ROCm Core SDK - Extras (MIGraphX, Optic, RVS)"
pkgver=10.2.0
pkgrel=1
epoch=0
arch=('x86_64')
url='https://www.amd.com'
license=('custom:AMD')
depends=('ocl-icd' 'gcc-libs')
provides=('migraphx' 'rvs' 'roc-optiq') # 'mivisionx' 'hipfort' 'rocpydecode' 'rocal'
conflicts=('migraphx' 'rvs' 'roc-optiq')
options=('!strip')
noextract=()

source=(
"https://stable.repo.amd.com/rocm/migraphx/tarball/amdrocm10-migraphx-2.19.0.tar.gz"
"https://stable.repo.amd.com/rocm/extras/rocoptiq/packages/ubuntu2604/pool/main/amdrocm10-roc-optiq_1.2.0.2-1_amd64.deb"
"https://stable.repo.amd.com/rocm/extras/rvs/packages/ubuntu2604/pool/main/amdrocm10-rvs_1.7.112-1077_amd64.deb"
# "https://rocm.frameworks.amd.com/deb-multi-arch/amdrocm-migraphx/pool/main/amdrocm-migraphx_2.16.0-3.py314_amd64.deb"
# "https://rocm.frameworks.amd.com/deb-multi-arch/amdrocm-migraphx/pool/main/amdrocm-migraphx-dev_2.16.0-3.py314_amd64.deb"
)

sha256sums=(
"7f5d6deab00f5f3281ffd0edc4cb740e371f7a2ff02d0c55a73215e687588c33"
"9e63f5e8d862ebd89b466ba9b7ae4974625d316a5b217dcadfe5f5e43ebaf585"
"d7d95705a47283f9e6f1adf145ad20c800c20ebc7d95abb70c2008d6c2fc61ca"
)

prepare() {
    mkdir -p "${srcdir}/opt/migraphx"
    bsdtar xf amdrocm10-migraphx-2.19.0.tar.gz -C ${srcdir}/opt/migraphx
}


package() {
    for p in *.deb; do
        ar x "${p}"
        if [[ -f data.tar.gz ]]; then
            # echo gz: "${srcdir}/${p}"
            tar xfx data.tar.gz
            rm data.tar.gz
        elif [[ -f data.tar.xz ]]; then
            # echo xz: "${srcdir}/${p}"
            tar xJf data.tar.xz
            rm data.tar.xz
        fi
    done

    mkdir -p "$pkgdir/opt"
    cp -a "$srcdir/opt/." "$pkgdir/opt/"
}
