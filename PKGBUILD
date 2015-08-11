# Maintainer: Tiago Brait <tiagobrait AT gmail DOT com>

#2014 tiagobrait
pkgname=ca-certificates-icp_br
pkgver=20153107
pkgrel=1
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="http://www.iti.gov.br/icp-brasil/certificados/188-atualizacao/4530-ac-raiz"
license=('GPL')
depends=('ca-certificates')
makedepends=('unzip')
install='ca-certificates-icp_br.install'
source=(
    'http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip'
    )

sha512sums=(
    '3102c3ac9dfa3fd550f6267966ad71ecb83d2ca3ddd5a4e1f553230670c9dab96bc224370da18924bb5d6154872a90b656c77c10f2ddfbf58fd00b15cae56256'
    )

package() {
  local cert_tag='icp_br'
  cd ${srcdir}
  for cert in $(find * -name '*.crt'); do
    #apprently some geniuses decided to include filenames with spaces in newer 
    #releaes, so we need to look for them and rename if necessary. nice going.
    local nospc_name=$(echo $cert | sed s/\ /_/g)
    if [ "$cert" != "$nospc_name" ]; then 
      mv "$cert" "$nospc_name"
      cert=$nospc_name
    fi
    
    #'tag' each certificate's filename, so it's easier to identify them, since 
    #looks like we cannot put them in a subdirectory anymore.
    local new_cert_name=${cert_tag}.${cert}
    
    #avanced debugging techniques
    #echo  "> processing  $cert (to become $new_cert_name)"

    #some certificates are distributed with a .crt extension but are actually
    #in DER format  instead of PEM (probably because government). If that's the
    #case, we convert them to PEM so everything works properly.
    if [ "$(file $cert | cut -f2 -d\: | tr -d ' ')" = "data" ]; then
      local cert_der=${cert}.der
      mv ${cert}  ${cert_der}
      /usr/bin/openssl x509 -in ${cert_der} -inform der -out ${new_cert_name}
      rm $cert_der
      msg2 "Converted '$(basename $cert)' from DER to PEM"
    else
      mv ${cert} ${new_cert_name}
    fi
  done
  install -d -m0755 $pkgdir/etc/ca-certificates/trust-source/anchors
  install -m0644 *.crt $pkgdir/etc/ca-certificates/trust-source/anchors
}
