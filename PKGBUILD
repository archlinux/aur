# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>

pkgname=libclc-minimal-git
pkgver=20.0.0_r510973.d6d60707ec2b
pkgrel=1
pkgdesc="companion package to llvm-minimal-git,  Library requirements of the OpenCL C programming language"
arch=('any')
url="https://libclc.llvm.org/"
license=('MIT')
provides=(libclc)
conflicts=(libclc)
makedepends=(llvm-minimal-git clang-minimal-git cmake  git python spirv-llvm-translator-minimal-git ninja)
source=("git+https://github.com/llvm/llvm-project.git"
)
sha256sums=('SKIP'
)
options=(!lto !debug)

# ninja grabs all available cores and leaves almost nothing for other processes.
# this package uses the environment variable NINJAFLAGS to allow the user to change this behaviour
# The responsibility to validate the value of NINJAFLAGS lies with the user.
# If unsure, use NINJAFLAGS=""

prepare() {
  cd llvm-project
  local _commit_hash=$(echo $(pacman -Q llvm-minimal-git) | cut -d' ' -f2 |  cut -d'-' -f1 | cut -d'.' -f4)
  # makepkg installs deps after processing the body of the PKGBUI:LD. 
  # This prevents using _commit_hash in the source= array unless llvm-minimal-git is installed before build starts.
  # best alternative seems to be to use git reset in prepare() .
  # example how the command works
  # pacman -Q llvm-minimal-git output =   llvm-minimal-git 17.0.0_r461863.8064caf83fb1-1
  # the first cut removes (pkgname) llvm-minimal-git
  # the 2nd cut removes (pkgrel) 1
  # the 3rd removes (revision count) r461863 so only (the commit hash) 8064caf83fb1 remains

  git reset --hard $_commit_hash
}

pkgver() {
    cd llvm-project/cmake/Modules

    # This will almost match the output of `llvm-config --version` when the
    # LLVM_APPEND_VC_REV cmake flag is turned on. The only difference is
    # dash being replaced with underscore because of Pacman requirements.
    local _pkgver=$(awk -F 'MAJOR |MINOR |PATCH |)' \
            'BEGIN { ORS="." ; i=0 } \
             /set\(LLVM_VERSION_/ { print $2 ; i++ ; if (i==2) ORS="" } \
             END { print "\n" }' \
             LLVMVersion.cmake)_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
    echo "${_pkgver}"
}

build() {
    cmake \
      -B _build \
      -S "$srcdir"/llvm-project/libclc  \
      -G Ninja \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_INSTALL_PREFIX=/usr \
      -Wno-dev
    ninja $NINJAFLAGS -C _build


}

package() {
  DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C _build install
  install -Dm644 "$srcdir"/llvm-project/libclc/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.TXT
}

