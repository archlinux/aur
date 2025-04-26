_basepgkname=cosmopolitan
pkgname="${_basepgkname}-bin"
pkgver=4.0.2
pkgrel=1
pkgdesc="Build-once run-anywhere c library."
arch=('x86_64' 'aarch64')
url="https://github.com/jart/cosmopolitan"
license=('ISC')
source=(    
            "${pkgname}::https://github.com/jart/cosmopolitan/releases/download/${pkgver}/cosmocc-${pkgver}.zip"
            "ape.conf"
            "ape-jart.conf"
        )

sha256sums=(
            '85b8c37a406d862e656ad4ec14be9f6ce474c1b436b9615e91a55208aced3f44'
            '0a5d918ef46aaf764293fb18794eac021cb93637fe6abed7c9d3f06b7b2f4cad'
            '9351247b53d34dc584170c435512954b8eb1a69c7b3ff0bee43ce21264b8d467'
          )

provides=(  
        )

conflicts=('cosmopolitan-git' 'wine' 'wine-staging')
options=(!strip)


current_arch=$(uname -m)
current_os=$(uname -s | tr [':upper:'] [':lower:'])

checkBinary() { 
  binary=$1
  if (echo $binary | grep -q $current_arch)  && (echo $binary | grep -q $current_os) && !(echo $binary | grep -q '\.') && !(file "${srcdir}/bin/${binary}" | grep -q 'ASCII')
  then
    return 0
  else
    return 1
  fi
}

cleanBinaryName(){
  binary=$1
  echo $(echo $binary | sed "s/^${current_arch}-${current_os}-//" | sed 's/-//g')
}

build() {

  for binary in $(ls "${srcdir}/bin"); do
    # echo $binary
    if checkBinary $binary;
    then
      # echo $(cleanBinaryName $binary)
      provides+=$(cleanBinaryName $binary)
    fi
  done

}

package() {

  # Install binfmt files 
  install -Dm544 "ape.conf" "${pkgdir}/etc/binfmt.d/ape.conf"
  install -Dm544 "ape-jart.conf" "${pkgdir}/etc/binfmt.d/ape-jart.conf"

  # cd "${srcdir}/bin"
  # Install binaries
  # unzip -l cosmocc-3.9.3.zip | grep linux | grep x86 | grep bin | cut -d'/' -f2 | sed 's/^x86_64-linux-//' | sed 's/-//g'

  install -Dm755 "${srcdir}/bin/ape-${current_arch}.elf" "${pkgdir}/usr/bin/ape" 

  for binary in $(ls "${srcdir}/bin"); do
    if (checkBinary $binary)
    then
      install -Dm755 "${srcdir}/bin/${binary}" "${pkgdir}/usr/bin/$(cleanBinaryName $binary)"
    fi
  done

}
