# Maintainer: EatMyVenom <eat.my.venomm@gmail.com>
# Contributer: Gladyshev Ilya <fixfromdarkness@cock.li>

pkgname=nix-bin
pkgver=2.3.10
pkgrel=1
pkgdesc="A purely functional package manager - /nix/store multi-user edition"
arch=('i686' 'x86_64' 'aarch64')
url="https://nixos.org/nix"
license=('LGPL')
makedepends=('xz')
conflicts=('nix')
install=nix.install
source_x86_64=("https://nixos.org/releases/nix/nix-$pkgver/nix-$pkgver-x86_64-linux.tar.xz")
source_i686=("https://nixos.org/releases/nix/nix-$pkgver/nix-$pkgver-i686-linux.tar.xz")
source_aarch64=("https://nixos.org/releases/nix/nix-$pkgver/nix-$pkgver-aarch64-linux.tar.xz")
source=(nix.install nix.tmpfiles nix.conf nix-channels)
backup=('etc/nix/nix.conf' 'root/.nix-channels')
options=('!strip' 'staticlibs' 'libtool' 'emptydirs')
SOURCE_DATE_EPOCH=1

NIX_SRC=nix-$pkgver-$CARCH-linux

nix_store_nix() {
  cd $srcdir/$NIX_SRC/store && echo *-nix-$pkgver
}

build() {
  {
    echo "g nixbld"
    for x in {1..32}; do
      echo "m nixbld$x nixbld"
    done
  } > $srcdir/nix.sysusers

  { # patch nix-daemon.sh to add user channels to NIX_PATH, see https://github.com/NixOS/nixpkgs/pull/38351
    NIX_STORE_NIX=$(nix_store_nix)
    cat $srcdir/$NIX_SRC/store/$NIX_STORE_NIX/etc/profile.d/nix-daemon.sh
    echo 'export NIX_PATH="$HOME/.nix-defexpr/channels:$NIX_PATH"'
  } > $srcdir/nix-daemon.sh
}

package() {
  NIX_STORE_NIX=$(nix_store_nix)

  install -dm0755 $pkgdir/nix/var/nix/db $pkgdir/nix/var/pacman/store $pkgdir/nix/var/nix/gcroots/pacman $pkgdir/usr/bin
  install -dm1775 $pkgdir/nix/store
  install -dm0750 $pkgdir/root
  install -Dm0644 -t $pkgdir/etc/nix/ $srcdir/nix.conf
  install -Dm0644 $srcdir/nix.sysusers $pkgdir/usr/lib/sysusers.d/$pkgname.conf
  install -Dm0644 $srcdir/nix.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$pkgname.conf
  install -Dm0644 $srcdir/$NIX_SRC/.reginfo $pkgdir/nix/var/pacman/db
  install -Dm0644 -t $pkgdir/etc/profile.d/ $srcdir/nix-daemon.sh
  install -m0664 $srcdir/nix-channels $pkgdir/root/.nix-channels
  ln -s /nix/var/nix/profiles/default $pkgdir/root/.nix-profile

  for f in $srcdir/$NIX_SRC/store/$NIX_STORE_NIX/bin/*; do
    ln -s /nix/store/$NIX_STORE_NIX/bin/nix $pkgdir/usr/bin/$(basename $f)
  done

  for f in /include/nix \
      /lib/{libnixexpr,libnixmain,libnixstore,libnixutil}.so \
      /lib/pkgconfig/{nix-expr,nix-main,nix-store}.pc \
      /lib/systemd/system/nix-daemon.{service,socket} \
      /share/doc/nix \
      /share/man/man1/nix-{build,channel,collect-garbage,copy-closure,env,hash,instantiate,prefetch-url,shell,store}.1.gz \
      /share/man/man5/nix.conf.5.gz /share/man/man8/nix-daemon.8.gz
  do
    [[ -e $srcdir/$NIX_SRC/store/$NIX_STORE_NIX$f ]] || (echo "$f not found" >&2 && false)
    install -dm0755 $pkgdir/usr$(dirname $f)
    ln -s /nix/store/$NIX_STORE_NIX$f $pkgdir/usr$f
  done

  for f in $srcdir/$NIX_SRC/store/*; do
    cp -a $f $pkgdir/nix/var/pacman/store/
    chmod -R ogu-w $pkgdir/nix/var/pacman/store/$(basename $f)
    ln -s /nix/store/$(basename $f) $pkgdir/nix/var/nix/gcroots/pacman/
  done
}
md5sums=('d0ea6ac6013dfcf18c105c45bbb4be41'
         '9ece6a19a8bf818b23e2d7d0fb6f5cef'
         '9b748e49cadb4d29eec57e7cf759bf35'
         '4a5758557e088ecd1438502328b38fa7')
md5sums_i686=('e3375004e5d0cd2ca81f6c30d41a5223')
md5sums_x86_64=('755e229d09fb4b4f0cffdec8d98f221c')
md5sums_aarch64=('e5183d9604b3a1c4c8109fa8ec0b2c01')
