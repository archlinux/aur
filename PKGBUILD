# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=rvm
pkgbase=${pkgname}
pkgver=1.29.12
pkgrel=1
pkgdesc='RVM is a command-line tool which allows you to easily install, manage, and work with multiple ruby environments from interpreters to sets of gems.'
arch=('any')
url="https://github.com/rvm/rvm/"
license=('Apache License')
depends=('gdbm' 'openssl'  'libffi'  'libyaml'  'gmp'  'zlib')
makedepends=('curl')
source=(
  "https://raw.githubusercontent.com/rvm/rvm/${pkgver}/binscripts/rvm-installer"
  "https://raw.githubusercontent.com/rvm/rvm/${pkgver}/binscripts/rvm-installer.asc"
  "rvm.sh"
  "rvmrc"
)
sha256sums=(
  'fea24461e98d41528d6e28684aa4c216dbe903869bc3fcdb3493b6518fae2e7e'
  '74b9015e977412ee63b9ce7521111f82e71b013bb2ad512855a04e37cd2f526c'
  '48b6e852380c9e9b8d3b3c3ce8e50d397429dd1efeee06a75e121df1a2df47e2'
  'f9444e8c5817c4a59fc701b8a71cef0a7114a9dda549ad82c5800983f1a54738'
)
validpgpkeys=(
  '409B6B1796C275462A1703113804BB82D39DC0E3'
  '7D2BAF1CF37B13E2069D6956105BD0E739499BDB'
)

build() {
  export rvm_ignore_gemrc_issues=1
  bash ./rvm-installer --path $srcdir/rvm --ignore-dotfiles --version ${pkgver}
}

package() {
  cd "$srcdir"

  # /etc
  install -dm0755 "$pkgdir"/etc/profile.d
  install -Dm644 rvm.sh -t "$pkgdir"/etc/profile.d/
  install -Dm644 rvmrc -t "$pkgdir"/etc/
  install -dm0755 "$pkgdir"/etc/skel/.rvm/{archives,bin,environments,gems,gems_cache,hooks,log,pkgs,repos,rubies,rubygems,src,tmp,user,wrappers}

  # /usr/share
  install -dm0755 "$pkgdir"/usr/share
  cd rvm
  find . -type d -exec install -d {,"$pkgdir"/usr/share/rvm/}{} \;
  find . -type f -exec install -D {,"$pkgdir"/usr/share/rvm/}{} \;
}
