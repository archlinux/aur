_with_cuda=true

pkgname=xgboost
pkgdesc='An optimized distributed gradient boosting library.'
pkgver=1.7.4
pkgrel=1
url=https://github.com/dmlc/xgboost
source=(
    "git+https://github.com/dmlc/xgboost.git#tag=v${pkgver}"
    "git+https://github.com/rapidsai/gputreeshap.git#commit=787259b"
    "git+https://github.com/NVlabs/cub.git#commit=af39ee2"
    "git+https://github.com/dmlc/dmlc-core.git#commit=dfd9365"
)
if $_with_cuda; then
    makedepends+=('cuda')
fi
arch=('x86_64')
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare(){
    cd $pkgname
    git config submodule.gputreeshap.url "${srcdir}/gputreeshap"
    git config submodule.cub.url "${srcdir}/cub"
    git config submodule.dmlc-core.url "${srcdir}/dmlc-core"
    git -c protocol.file.allow=always submodule update
}

build(){
    local cmake_args=()
    cd $pkgname
    [ -d build ] || mkdir build
    cd build
    if $_with_cuda; then
        cmake_args+=('-DUSE_CUDA=ON' '-DBUILD_WITH_CUDA_CUB=ON')
        if [ -n "$_compute_ver" ]; then
            cmake_args+=("-DGPU_COMPUTE_VER=$_compute_ver")
        fi
        CC=/opt/cuda/bin/gcc CXX=/opt/cuda/bin/g++ cmake .. ${cmake_args[@]}
    else
        cmake .. ${cmake_args[@]}
    fi
    make
}

package(){
    cd $pkgname
    # Install License
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
    # Install Documentation
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  
    # Install main executable
    install -Dm755 "xgboost" "${pkgdir}/usr/bin/xgboost"
  
    # Install shared libraries
    mkdir -p "${pkgdir}/usr/lib"
    install -Dm644 lib/*.so "${pkgdir}/usr/lib"
  
    # Install includes
    mkdir -p "${pkgdir}/usr/include"
    cp -r include/xgboost "${pkgdir}/usr/include"
    cp -r dmlc-core/include/dmlc "${pkgdir}/usr/include"
    cp -r rabit/include/rabit "${pkgdir}/usr/include"
  
    # Copy the demos to opt/xgboost
    mkdir -p "${pkgdir}"/opt/xgboost
    cp -r demo "${pkgdir}"/opt/xgboost
}
