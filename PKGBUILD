# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=iwlwifi
pkgver=2021.03.26.r0.g23c990843
pkgrel=1
pkgdesc="Intel wireless chips driver (current kernel release cycle)"
arch=('i686' 'x86_64')
url="https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi"
license=('GPL')
makedepends=('git' 'linux-headers' 'xz')
#source=('git+https://kernel.googlesource.com/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes.git')
#sha256sums=('SKIP')


_gitsource="https://kernel.googlesource.com/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes.git"
_gittag="iwlwifi-sent-for-review-2021-03-26"  # $(git ls-remote --refs --sort -v:refname "$_gitsource" "iwlwifi-next*" | grep -m 1 -o "iwlwifi.*")
_moduleSrc="iwlwifi-fixes/drivers/net/wireless/intel/iwlwifi"

prepare() {
  cd "$srcdir"
  if [ ! -d "iwlwifi-fixes" ]; then
    git clone --single-branch --branch "$_gittag" --depth 1 "$_gitsource"
  fi

  cd "iwlwifi-fixes"
  git checkout tags/"$_gittag"

  # https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1910510.html
  sed -i 's|$(srctree)/||' "$srcdir/$_moduleSrc/dvm/Makefile"
  sed -i 's|$(srctree)/||' "$srcdir/$_moduleSrc/mvm/Makefile"
}

pkgver() {
  cd "$_moduleSrc"

  _tag=$(sed 's/iwlwifi[^0-9]*//;s/-/./g' <<< "$_gittag")
  _hash=$(git rev-parse --short HEAD)
  _rev=$(git rev-list --count "$_hash"..HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

build() {
  make -C "/usr/lib/modules/$(uname -r)/build" M="$srcdir/$_moduleSrc"
}

package() {
  cd "$_moduleSrc"

  find './' -name '*.ko' -exec xz -0 --force {} \;

  _updates="/usr/lib/modules/$(uname -r)/updates"
  install -Dm644 "iwlwifi.ko.xz" -t "$pkgdir/$_updates"
  install -Dm644 "dvm/iwldvm.ko.xz" -t "$pkgdir/$_updates"
  install -Dm644 "mvm/iwlmvm.ko.xz" -t "$pkgdir/$_updates"
}
