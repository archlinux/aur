# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-epgsearch
pkgver=1.0.1.beta5_12_ga908daa
_gitver=a908daa4c5c6edd6c560ed96939358b4352e9b42
_vdrapi=2.2.0
epoch=1
pkgrel=1
pkgdesc="Searchtimer and replacement of the VDR program menu"
url="http://winni.vdr-developer.org/epgsearch"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
optdepends=('msmtp: To send notification mails (Simpler replacement for sendmail)'
            'ssmtp: To send notification mails (Another simpler replacement for sendmail)')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-$_plugname.git#commit=$_gitver"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-conflictcheckonly.conf"
        "etc/vdr/conf.avail/50-$_plugname.conf"
        "etc/vdr/conf.avail/50-${_plugname}only.conf"
        "etc/vdr/conf.avail/50-quick$_plugname.conf"
        'var/lib/vdr/plugins/epgsearch/epgsearchcats.conf-epgdata'
        'var/lib/vdr/plugins/epgsearch/epgsearchcats.conf-tvm2vdr-hoerzu'
        'var/lib/vdr/plugins/epgsearch/epgsearchcats.conf-tvm2vdr-tvmovie'
        'var/lib/vdr/plugins/epgsearch/epgsearchconflmail.templ'
        'var/lib/vdr/plugins/epgsearch/epgsearchmenu.conf'
        'var/lib/vdr/plugins/epgsearch/epgsearchupdmail-html.templ'
        'var/lib/vdr/plugins/epgsearch/epgsearchupdmail.templ')
options=('!emptydirs')
md5sums=('SKIP'
         '9a936790ce844d011d8bbb3bf13ec336')

pkgver() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  git tag -a 1.0.1.beta5 -m 'Added Tag' 7fea7fca409bf75cba18ba5f07c4fe8a3bd72e75 2> /dev/null
  git describe --tags | sed 's/-/_/g'
}

prepare() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  sed -i 's/^Menu/# Menu/g' conf/epgsearchmenu.conf
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make REGEXLIB='' #Empty REGEXLIB to force regex.h from glibc
}


package() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
  echo "[${_plugname}only]" > "$pkgdir/etc/vdr/conf.avail/50-${_plugname}only.conf"
  echo "[conflictcheckonly]" > "$pkgdir/etc/vdr/conf.avail/50-conflictcheckonly.conf"
  echo "[quick${_plugname}]" > "$pkgdir/etc/vdr/conf.avail/50-quick${_plugname}.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
