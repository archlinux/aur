# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=blacknon
_pkgname=lssh
_pkgexec=(lssh lscp lsftp lsmon lsshell)
pkgname=${_pkgname}-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='A list-based SSH/SCP/SFTP client supporting single and parallel connections, local bashrc usage on remote machines, and advanced proxying'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
_barch=('linux_amd64')
license=('MIT')

provides=("${_pkgexec[@]}")
conflicts=("${_pkgname}")
depends=('glibc')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
sha256sums_x86_64=('4a45e5165393374edb71f875a1bd781dc552e65dff516c3c12797e3fd179b096')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
  cd "${srcdir}/${_pkgname}_${pkgver}_${_CARCH}/" || exit

  for bin in ${_pkgexec[@]}; do
    install -Dm755 "./bin/${bin}" "${pkgdir}/usr/bin/${bin}"
  done

  install -Dm644 "./completion/zsh/_${_pkgexec[0]}" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "./completion/zsh/_${_pkgexec[1]}" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "./completion/zsh/_${_pkgexec[2]}" -t "$pkgdir/usr/share/zsh/site-functions/"

  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
