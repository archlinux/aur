# Maintainer: Andreas Wendleder <gonsolo@gmail.com>
# Note that ispc v1.28.0 has to be patched with the two patches from
# https://github.com/ispc/ispc/issues/3545, otherwise, moonray will not work.
pkgname=openmoonray
pkgver=2.15.0.1
pkgrel=3
pkgdesc="DreamWorks Animation's open-source Monte Carlo ray tracer"
arch=('x86_64')
url="https://github.com/dreamworksanimation/openmoonray"
license=('Apache')

source=("git+${url}.git#tag=${pkgname}-${pkgver}"
        "v${pkgver}.Arch.patch") # User-provided patch file

sha256sums=('df233e26fd5d2cf807c34c8e75bfa00364500df629f5e877239a49bfbcdb7eae'
            '6098e2ceb785945459dcbf2f1d1e8ab51f32bdbfb0e196b84a595ca6bcf95833')

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
        -G "Unix Makefiles" \
        ../${pkgname}

  cmake --build .
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

