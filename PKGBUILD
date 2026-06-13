# Maintainer: Andreas Wendleder <gonsolo@gmail.com>
pkgname=openmoonray
pkgver=3.6.0.1
pkgrel=1
pkgdesc="DreamWorks Animation's open-source Monte Carlo ray tracer"
arch=('x86_64')
url="https://github.com/dreamworksanimation/openmoonray"
license=('Apache')

source=("git+${url}.git#tag=${pkgname}-${pkgver}"
        "v${pkgver}.Arch.patch") # User-provided patch file

sha256sums=('86a8ca7fbb7de3b3bd9f2627cab68b63ed20cd1c1cccfcb69ddc969d096f3239'
            '1a7f53babb9614a8c12322f701844de3a64dfe1f42add0c6a6ba30c9e3d633a4')

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

