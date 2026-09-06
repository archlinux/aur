# Maintainer: llavon-ime contributors

_pkgname=llavon-ime-fcitx5
_srcname=ime-fcitx5
_model_file=llavon-ime-llama-250m-Q4_K_M.gguf
pkgname=${_pkgname}-preview-git
pkgver=0.3.4.r2.g3cb7573
pkgrel=1
pkgdesc='Preview branch of the Fcitx5 frontend and local inference service for Llavon IME'
arch=('x86_64' 'aarch64')
url='https://github.com/llavon-ime/ime-fcitx5/tree/preview'
license=('BSD-2-Clause' 'MIT' 'Apache-2.0' 'BSL-1.0' 'CC-BY-NC-4.0')
depends=('fcitx5' 'glibc' 'libgcc' 'libstdc++' 'vulkan-icd-loader')
makedepends=('cmake' 'curl' 'git' 'ninja' 'python' 'tar' 'unzip' 'zip')
optdepends=(
    'fcitx5-configtool: graphical configuration for fcitx5'
    'vulkan-driver: Vulkan GPU acceleration'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git" "${_pkgname}-git-debug")
source=(
    "${_srcname}::git+https://github.com/llavon-ime/ime-fcitx5.git#branch=preview"
    "${_model_file}::https://huggingface.co/tony65535/llavon-ime-llama-250m-GGUF/resolve/main/${_model_file}"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "${_srcname}"

    local describe base_version
    describe="$(git describe --long --tags --abbrev=7 2>/dev/null || true)"
    if [[ -n "${describe}" ]]; then
        printf '%s\n' "${describe}" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
        return
    fi

    base_version="$(sed -n 's/^project(llavon-ime VERSION \([^ ]*\).*/\1/p' fcitx5/CMakeLists.txt)"
    base_version="${base_version:-0.1.0}"
    printf '%s.r%s.g%s\n' "${base_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    git -C "${_srcname}" submodule update --init --recursive
    "${srcdir}/${_srcname}/vcpkg/bootstrap-vcpkg.sh" -disableMetrics

    cmake -S "${_srcname}/ime-unix-service" -B unix-service-build -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_TOOLCHAIN_FILE="${srcdir}/${_srcname}/vcpkg/scripts/buildsystems/vcpkg.cmake" \
        -DVCPKG_MANIFEST_FEATURES=llama-vulkan \
        -DIME_UNIX_SERVICE_BUILD_TESTS=ON
    cmake --build unix-service-build

    cmake -S "${_srcname}/fcitx5" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_TOOLCHAIN_FILE="${srcdir}/${_srcname}/vcpkg/scripts/buildsystems/vcpkg.cmake" \
        -DIME_FCITX5_INSTALLED_MODEL_PATH="/usr/share/llavon-ime/models/${_model_file}" \
        -DIME_FCITX5_DISPLAY_VERSION="${pkgver}" \
        -DIME_FCITX5_BUILD_TESTS=ON
    cmake --build build
}

check() {
    ctest --test-dir unix-service-build --output-on-failure
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="${pkgdir}" cmake --install unix-service-build
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${srcdir}/${_model_file}" \
        "${pkgdir}/usr/share/llavon-ime/models/${_model_file}"
    cmake \
        -DVCPKG_INSTALLED_DIR="${srcdir}/unix-service-build/vcpkg_installed" \
        -DDESTINATION="${pkgdir}/usr/share/licenses/${pkgname}" \
        -DPROJECT_ROOT="${srcdir}/${_srcname}" \
        -P "${srcdir}/${_srcname}/scripts/install-licenses.cmake"
}
