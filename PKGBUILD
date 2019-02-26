pkgname=nix-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="A purely functional package manager - /nix/store multi-user edition"
arch=('i686' 'x86_64')
url="https://nixos.org/nix"
license=('LGPL')
makedepends=('bzip2')
conflicts=('nix')
install=nix.install
source_x86_64=("https://nixos.org/releases/nix/nix-$pkgver/nix-$pkgver-x86_64-linux.tar.bz2")
source_i686=("https://nixos.org/releases/nix/nix-$pkgver/nix-$pkgver-i686-linux.tar.bz2")
source=(nix.install nix.tmpfiles nix.conf nix-channels)
sha256sums_x86_64=('e229e28f250cad684c278c9007b07a24eb4ead239280c237ed2245871eca79e0')
sha256sums_i686=('223c141b7ce322aacd4003dfc79b969ee813396d2ac586cf44c0e787233b1666')
sha256sums=(SKIP SKIP SKIP SKIP)
backup=('etc/nix/nix.conf' 'root/.nix-channels')
options=('!strip' 'staticlibs' 'libtool' 'emptydirs')
SOURCE_DATE_EPOCH=1

NIX_STORE_NIX=5hdmx9yk7gr71b98j4vh9271k0zg5jis-nix-2.2.1
NIX_STORE_CACERT=fna8lggi520pgvdwi8p1xyzcj9706j04-nss-cacert-3.40.1
NIX_SRC=nix-$pkgver-$CARCH-linux

build() {
  {
    echo "g nixbld"
    for x in {1..32}; do
      echo "m nixbld$x nixbld"
    done
  } > $srcdir/nix.sysusers

  { # patch nix-daemon.sh to add user channels to NIX_PATH, see https://github.com/NixOS/nixpkgs/pull/38351
    cat $srcdir/$NIX_SRC/store/$NIX_STORE_NIX/etc/profile.d/nix-daemon.sh
    echo 'export NIX_PATH="$HOME/.nix-defexpr/channels:$NIX_PATH"'
  } > $srcdir/nix-daemon.sh
}

package() {
  ROOT_HOME=$(echo ~root)
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
    ln -s /nix/store/$(basename $f) $pkgdir/nix/var/nix/gcroots/pacman/
  done
}
