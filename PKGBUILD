# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=iwlwifi
pkgver=2018.03.19.r0.g9f4ef1d70
pkgrel=1
pkgdesc="Intel wireless chips driver (current kernel release cycle)"
arch=('i686' 'x86_64')
url="https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi"
license=('GPL')
makedepends=('git' 'linux-headers' 'xz')
#source=('git+https://kernel.googlesource.com/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes.git')
#sha256sums=('SKIP')
#validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
#              '647F28654894E3BD457199BE38DBBDC86092693E') # Greg Kroah-Hartman


_gitsource="https://kernel.googlesource.com/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes.git"
_gittag="iwlwifi-for-kalle-2018-03-19"  # $(git ls-remote --refs --sort -v:refname "$_gitsource" "iwlwifi-*" | grep -m 1 -o "iwlwifi.*")
_moduleSrc="iwlwifi-fixes/drivers/net/wireless/intel/iwlwifi"

prepare() {
  cd "$srcdir"
  if [ ! -d "iwlwifi-fixes" ]; then
    git clone --branch "$_gittag" "$_gitsource" --depth 1
  fi

  cd "$srcdir/iwlwifi-fixes"
  git checkout tags/"$_gittag"
}

pkgver() {
  cd "$srcdir/$_moduleSrc"

  _tag=$(sed 's/iwlwifi-for-kalle-//;s/-/./g' <<< "$_gittag")
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
