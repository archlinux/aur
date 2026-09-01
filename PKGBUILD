# Maintainer: Andreas Wendleder <gonsolo@gmail.com>
pkgname=openmoonray
pkgver=2026.29.1
pkgrel=1
pkgdesc="DreamWorks Animation's open-source Monte Carlo ray tracer"
arch=('x86_64')
url="https://github.com/OpenMoonRay/openmoonray"
license=('Apache')

source=("git+${url}.git#tag=v${pkgver}"
        "v${pkgver}.Arch.patch") # User-provided patch file

sha256sums=('a1c1baba5282ddc5b09f81e9b5532061268c4e836a6870f9a964a8f94612d3b3'
            'ee4f3c0b76b35e38cc97e529a1cce12169a448732039e3f2f453c6bf15c11a4c')

depends=(
  'gcc'
  'cmake'
  'boost'
  'lua'
  'jsoncpp'
  'tbb'
  'openvdb'
  'openimageio'
  'opencolorio'
  'openexr'
  'embree'
  'ispc'
  'python'
  'opensubdiv'
  'libmicrohttpd'
  'cppunit'
  'qt5-base'
  'qt5-script'
  'openimagedenoise'
  'usd'
  'random123'
)
makedepends=(
  'git'
)

# Makepkg's buildflags let moonray crash. Someone should go over the CFLAGS in /etc/makepkg.conf
# and find out which one.
options=(!buildflags)

build() {
  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DMOONRAY_USE_OPTIX=NO \
        -DMOONRAY_BUILD_TESTING=OFF \
        -DBUILD_TESTING=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -G "Unix Makefiles" \
        ../${pkgname}

  make -j$(nproc)
}

prepare() {
  cd "${srcdir}/${pkgname}"

  local base_github_org_url="${url%/*}" # This effectively removes /openmoonray from the main URL

  git config -f .gitmodules --get-regexp 'submodule\..*\.url' | while read -r line; do
    submodule_path=$(echo "$line" | awk '{print $1}' | sed 's/^submodule\.//;s/\.url$//')
    relative_url=$(echo "$line" | awk '{print $2}')

    if [[ "$relative_url" == "../"* ]]; then
      # Extract the submodule repository name (e.g., "arras4_core.git" from "../arras4_core.git")
      # This assumes the relative path directly corresponds to the repository name in the same organization.
      submodule_repo_name="${relative_url:3}" # Removes "../"

      # Construct the correct absolute URL using the base organization URL
      absolute_url="${base_github_org_url}/${submodule_repo_name}"
      echo "Rewriting submodule ${submodule_path} URL from ${relative_url} to ${absolute_url}"
      git config "submodule.${submodule_path}.url" "$absolute_url"
    fi
  done

  git submodule update --init --recursive

  cat "${srcdir}/v${pkgver}.Arch.patch" | patch -p1
}

package() {
  cd "${srcdir}/build"
  cmake --install . --prefix="${pkgdir}/usr"
}

