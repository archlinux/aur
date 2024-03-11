# Maintainer: somini <dev@somini.xyz>
_pkgname=nitter
pkgname=nitter-git
pkgver=latest
pkgrel=27
pkgdesc="Alternative Twitter front-end"
url="https://github.com/zedeus/nitter"
depends=('redis')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('git' 'nim' 'nimble' 'libsass' 'pcre')
backup=('etc/nitter.conf' 'etc/nitter/nitter.conf')
license=('AGPL3')
arch=('x86_64')
install=nitter.install
source=("$pkgname::git+$url.git#branch=guest_accounts"
    "config.patch"
    "tmpfilesd.conf"
    "nitter.sh"
    "nitter.service"
    "nitter.install"
    "https://patch-diff.githubusercontent.com/raw/zedeus/nitter/pull/1164.patch"
    )
sha256sums=('SKIP'
            '89a643cba8d8e9324441e1c901d939629fdbf6f9bc66d4f6c070dc75d8714b64'
            '7171b797a139d42939eda47a5a7d0259166f6eea284eff7f5f486c219017749f'
            '79469c5cfeacf38c7469a2240ba5c19670ddaf757e6d1b5286206a18a0718487'
            '560d98833c56979cb6b5d187a827788dbbdff95871f957225604b58b15c1c219'
            '5d8a7acc2bd5fb860e2e1ba58ed679d9aa494aeed1d6dedd9da4f658e6b01305'
            'd45b79f8ebef915d7671a759102c3e0dc925428bba4b5eec348f2da1da1e6d12')

pkgver() {
  cd "$pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
  cd "$pkgname"

  # Move example config file to the final location
  mv -v nitter.example.conf nitter.conf
  # Tweak the configuration file
  patch -p1 <"$srcdir/config.patch"
  # Other Patches
  patch -p1 <"$srcdir/1164.patch"
}

build() {
  cd "${srcdir}/$pkgname"

  # Based on the Dockerfile
  nimble build -y -d:danger -d:lto -d:strip
  nimble scss
  nimble md
}

package() {
  # Create the cache directory
  install -D -m644 tmpfilesd.conf "$pkgdir/usr/lib/tmpfiles.d/nitter.conf"
  # SystemD service
  install -D -m644 nitter.service -t "$pkgdir/usr/lib/systemd/system"
  # Use a wrapper script as entrypoint
  install -D -m755 nitter.sh "$pkgdir/usr/bin/nitter"

  main_dir="$pkgdir/usr/share/nitter"
  install -dD "$main_dir"

  cd "${srcdir}/$pkgname"
  # Main EXE
  install -D -m755 nitter -t "$main_dir"
  # Patched Configuration File
  install -D -m600 nitter.conf -t "$pkgdir/etc/$_pkgname"
  ## Link it on the "working" directory
  ln -sv "/etc/$_pkgname/nitter.conf" "$main_dir/nitter.conf"
  # Public Folder
  cp -r --no-preserve=all public -t "$main_dir"
  # System User
  echo 'u nitter - "Nitter" /usr/share/nitter' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
