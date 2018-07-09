# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=iwlwifi-next
pkgver=2018.05.30.r0.g50624782
pkgrel=1
pkgdesc="Intel wireless chips driver (next kernel release cycle)"
arch=('i686' 'x86_64')
url="https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi"
license=('GPL')
makedepends=('git' 'linux-headers' 'xz')
#source=('git+https://kernel.googlesource.com/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git')
#sha256sums=('SKIP')
#validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
#              '647F28654894E3BD457199BE38DBBDC86092693E') # Greg Kroah-Hartman


_gitsource="https://kernel.googlesource.com/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git"
_gittag=$(git ls-remote --refs --sort -v:refname "$_gitsource" "iwlwifi-next*" | grep -m 1 -o "iwlwifi.*")
_moduleSrc="iwlwifi-next/drivers/net/wireless/intel/iwlwifi"

prepare() {
  cd "$srcdir"
  if [ ! -d "iwlwifi-next" ]; then
    git clone --branch "$_gittag" "$_gitsource" --depth 1
  fi

  cd "$srcdir/iwlwifi-next"
  git checkout tags/"$_gittag"
}

pkgver() {
  cd "$srcdir/$_moduleSrc"

  _tag=$(sed 's/iwlwifi-next-for-kalle-//;s/-/./g' <<< "$_gittag")
  _hash=$(git rev-parse --short HEAD)
  _rev=$(git rev-list --count "$_hash"..HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

build() {
  make -C "/usr/lib/modules/$(uname -r)/build" M="$srcdir/$_moduleSrc"
}

package() {
  cd "$srcdir/$_moduleSrc"

  find './' -name '*.ko' -exec xz -0 --force {} \;

  _updates="/usr/lib/modules/$(uname -r)/updates"

  install -Dm644 'iwlwifi.ko.xz' "$pkgdir/$_updates/iwlwifi.ko.xz"

  pushd "dvm"
  install -Dm644 'iwldvm.ko.xz' "$pkgdir/$_updates/iwldvm.ko.xz"
  popd

  pushd "mvm"
  install -Dm644 'iwlmvm.ko.xz' "$pkgdir/$_updates/iwlmvm.ko.xz"
  popd
}
