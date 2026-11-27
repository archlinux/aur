# Maintainer: Felix Weilbach <fweilbach@proton.me>
pkgname=puppetxr-git
_pkgname=puppetxr
pkgver=0.2.0.r0.ga9f9513
pkgrel=1
pkgdesc='OpenXR simulator runtime: simulated headset and controllers driven by keyboard and mouse (git main)'
arch=('x86_64')
url='https://github.com/FlexW/puppetxr'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'git-lfs' 'cmake' 'ninja' 'python' 'shaderc')
# Loaded at run time with dlopen, so not linked; a window needs X11 or Wayland
optdepends=('vulkan-icd-loader: Vulkan apps'
            'libglvnd: OpenGL apps'
            'libx11: mirror window on X11'
            'libxcursor: mirror window on X11'
            'libxi: mirror window on X11'
            'libxrandr: mirror window on X11'
            'wayland: mirror window on Wayland'
            'libxkbcommon: keyboard input on Wayland'
            'fontconfig: UI fonts'
            'openxr: OpenXR loader for apps')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
install=$_pkgname.install
source=("git+$url.git")
sha256sums=('SKIP')

# makepkg clones from its local mirror, which has no LFS objects; they are pulled in prepare()
export GIT_LFS_SKIP_SMUDGE=1

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git lfs install --local
  git config lfs.url "$url.git/info/lfs"
  # Only data/ is built into the library; the rest of the LFS files are test fixtures
  git lfs pull --include='data/**'
}

build() {
  cmake -S "$_pkgname" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPUPPETXR_DIST=ON \
    -DPUPPETXR_WERROR=OFF \
    -DPUPPETXR_BUILD_TESTS=OFF \
    -DPUPPETXR_BUILD_APPS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
