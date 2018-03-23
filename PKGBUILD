# Maintainer: Calimero <calimeroteknik@free.fr>

pkgbase=linux-aufs_friendly  # Build kernel with a different name

# You can change pkgbase back to linux if you want to replace the one from [testing].
#pkgbase=linux
# In this case, also uncomment this horrendous hack to complete the 'provides' array for aufs3
#depmod() { provides+=('aufs_friendly'); unset depmod; depmod "$@"; }

pkgver=4.15.12

#Use the base branch:
[[ "$pkgver" = *.*.* ]] && _kernel="${pkgver%.*}" || _kernel="${pkgver}"
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.kernel.org/'
license=('GPL2')
pkgdesc='The aufs-compatible linux kernel and modules'
makedepends=('rsync')
_source=("https://raw.githubusercontent.com/sfjro/aufs4-standalone/aufs${_kernel}/aufs4-base.patch"
         "https://raw.githubusercontent.com/sfjro/aufs4-standalone/aufs${_kernel}/aufs4-standalone.patch"
         "https://raw.githubusercontent.com/sfjro/aufs4-standalone/aufs${_kernel}/aufs4-mmap.patch"
         'add-aufs-patches.diff')
_md5sums=('SKIP'
          'SKIP'
          'SKIP'
          '691bf49a7bad3214370c6debf985bcf6')
_sha256sums=('SKIP'
             'SKIP'
             'SKIP'
             'bca3d89a8ffb58cbeced34e277e6301b576fdd269e4d9eadad884ef168be2bc4')

## Fetch linux package sources from git
if [ ! -d upstream-linux ];then
  mkdir upstream-linux || exit 1
  pushd upstream-linux || exit 1
  git init -q || exit 1
  git remote add packages git://git.archlinux.org/svntogit/packages.git || exit 1
  git fetch packages packages/linux || exit 1
  git archive "packages/packages/linux:repos/testing-${CARCH}" | tar x || exit 1
  popd || exit 1
fi

# add AUFS patches
if [ ! -f upstream-linux/patched ];then
  patch -Np0 -i add-aufs-patches.diff || exit 1
  mv upstream-linux/PKGBUILD{,.upstream} || exit 1
  echo 'Do not remove this file: it indicates that these sources are patched for building an AUFS-friendly kernel.' > upstream-linux/patched
fi

# change the package basename to what's defined in this file
sed -i "s/^pkgbase=.*/pkgbase=${pkgbase}/" upstream-linux/PKGBUILD.upstream

# Hack for AUR package naming
pkgname="linux-aufs_friendly"

## Bootstrap build
cp upstream-linux/* .
source PKGBUILD.upstream

# Add AUFS patches' source URLs
source+=("${_source[@]}")
# Sometimes the maintainer feels like using md5, sometimes it's sha256
[[ "$md5sums" ]] && md5sums+=("${_md5sums[@]}")
[[ "$sha256sums" ]] && sha256sums+=("${_sha256sums[@]}")
