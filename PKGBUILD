# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
pkgname=rocm-bin-extras
pkgdesc="ROCm Core SDK - Extras (MIGraphX, Optic, RVS)"
pkgver=10.1.0
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
"https://stable.repo.amd.com/rocm/migraphx/tarball/amdrocm10-migraphx-2.18.0.tar.gz"
"https://stable.repo.amd.com/rocm/extras/rocoptiq/packages/ubuntu2604/pool/main/amdrocm10-roc-optiq_1.1.0.2-1_amd64.deb"
"https://stable.repo.amd.com/rocm/extras/rvs/packages/ubuntu2604/pool/main/amdrocm10-rvs_1.6.131-844_amd64.deb"
# "https://rocm.frameworks.amd.com/deb-multi-arch/amdrocm-migraphx/pool/main/amdrocm-migraphx_2.16.0-3.py314_amd64.deb"
# "https://rocm.frameworks.amd.com/deb-multi-arch/amdrocm-migraphx/pool/main/amdrocm-migraphx-dev_2.16.0-3.py314_amd64.deb"
)

sha256sums=(
"200ad8ef19057615f577c58af4b3010acc22ca1e8425a5866e96c42209f7d2a4"
"9932bbe621bee8cc9fa739f91be82862745fbc032472a29104b423a8e6f35d25"
"47b4bc75f4bc747edd33ba6861069e06210eed38b66ff7052b3175e2f8cabe6c"
)

prepare() {
    mkdir -p "${srcdir}/opt/migraphx"
    bsdtar xf amdrocm10-migraphx-2.18.0.tar.gz -C ${srcdir}/opt/migraphx
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
