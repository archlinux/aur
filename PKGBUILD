# Maintainer: Gladyshev Ilya <fixfromdarkness@cock.li>

pkgname=nix-bin
pkgver=2.3.8
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
sha256sums=(24bc9995ca2efdf107b03b6ed31b18f8efc1ab3e8d496e7c6a0eee4099b5a35b 2691263b3e32cf6a8aa7f3e537d09ad601772b41a89f3b6e45675621bfd1c0fd c5bfe41ce026651945f06efd55e600b0cd67248ef4993cb1b56ab6c05262f228 0799ce2f8b5fda245eb0131349ba6c0a46974602cd8ef5b41446a54337a68f13)
sha256sums_i686=('b6e100a704065728ce10408df3ccb2b97c68e4aa033efe5ec9c6d3346f98f011')
sha256sums_aarch64=('0b35f0d3b480e15ca4bf57ee0d90c5dd209f8bf6ab0c429a2e4aca6565b9d9a6')
sha256sums_x86_64=('0c8a432993d06e4d882ad48cde81d9bef23842cf6d7432cd93ef1a99c8d4ef43')
