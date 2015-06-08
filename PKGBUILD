# Maintainer: Chris Chapman <chris dot chapman at aggiemail dot usu dot edu>

pkgname=eclipse-axdt
pkgver=0.0.7.1
pkgrel=1
pkgdesc="Eclipse Plugin for ActionScript development"
arch=('i686' 'x86_64')
url="http://axdt.org/"
license=('EPL')
depends=('eclipse-imp')
source=(components.url)
md5sums=('a24d1dc66aaddb18e32cbbb84fe7d2b6')

build() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/axdt/eclipse
  _weburl="http://update.axdt.org/"
  
  cat components.url | while read _ctype _cname ; do
    case ${_ctype} in
      feature)
        msg "Downloading feature ${_cname}..."
        cd ${srcdir}
        wget -nc "${_weburl}/features/${_cname}" || return 1
        install -dm755 ${_dest}/features/${_cname/.jar}
        cd ${_dest}/features/${_cname/.jar}
        jar xf ${srcdir}/${_cname} || return 1
        ;;
      plugin)
        msg "Downloading plugin ${_cname}..."
        cd ${srcdir}
        wget -nc "${_weburl}/plugins/${_cname}" || return 1
        install -dm755 ${_dest}/plugins
        install -m644 ${srcdir}/${_cname} ${_dest}/plugins
        ;;
      unpack)
        msg "Downloading and unpacking plugin ${_cname}..."
        cd ${srcdir}
        wget -nc "${_weburl}/plugins/${_cname}" || return 1
        install -dm755 ${_dest}/plugins/${_cname/.jar}
        cd ${_dest}/plugins/${_cname/.jar}
        jar xf ${srcdir}/${_cname} || return 1
        ;;
      *)
        error "Unknown jar type..."
        return 1
        ;;
    esac
  done
  
}
