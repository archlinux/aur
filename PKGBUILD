# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=purevpn-openvpn
pkgver=2016.12.27
pkgrel=1
pkgdesc='OpenVPN hackery to add PureVPN to NetworkManager'
arch=('any')
url='https://www.purevpn.com/'
license=('GPL')
depends=('networkmanager-openvpn')
source=("linux-files.zip::https://s3-us-west-1.amazonaws.com/heartbleed/linux/linux-files.zip"
        "template"
        "purevpn")        
sha256sums=('32ee473d414691438618d68740c7060ad1218719e13b41561b18c3d0a659ae01'
            '7d89dab51332eb5fb3cc31524d4979582610f2d4ea4a4cc30b16255c5ff318c6'
            'ce18724ea37de4b94e429283a611d850f4c8890732e7beb94ae76e7ac1bb86f5')
noextract=("linux-files.zip")
install="${pkgname}".install

prepare() {
  cd "${srcdir}"
  
  msg2 "Extracting Certifications..."
  bsdtar -xf linux-files.zip -s'|[^/]*/||' "*.key" "*.crt"
  
  msg2 "Extracting OpenVPN Configurations..."
  mkdir "vpn-configs"
  bsdtar -xf linux-files.zip  -s'|[^/]*/||' -C vpn-configs *.ovpn
  
  cd "vpn-configs"
  msg2 "Creating Configuration Files..."
  
  mkdir system-connections
  for proto in TCP UDP; do
    find ${proto}/*.ovpn -print0 | while read -d $'\0' file
    do
      filename="${file/#${proto}\//}"
      filename=$(echo ${filename/%.ovpn/} | tr '[:lower:]' '[:upper:]')
      cp "${startdir}/template" "system-connections/${filename}-PUREVPN"
      host=$(egrep -o ".*\.pointtoserver\.com" "$file" | sed 's/^remote //')
      if [ "$proto" == "UDP" ]; then port=53; 
      elif [ "$proto" == "TCP" ]; then port=80; fi
      if [ "$proto" == "TCP" ]; then 
        sed -i '/port=/a \proto-tcp=yes' "system-connections/${filename}-PUREVPN"
      fi
      uuid=$(cat /dev/urandom | tr -dc 'a-f0-9' | fold -w 8 | head -n 1)-$(cat /dev/urandom | tr -dc 'a-f0-9' | fold -w 4 | head -n 1)-$(cat /dev/urandom | tr -dc 'a-f0-9' | fold -w 4 | head -n 1)-$(cat /dev/urandom | tr -dc 'a-f0-9' | fold -w 4 | head -n 1)-$(cat /dev/urandom | tr -dc 'a-f0-9' | fold -w 12 | head -n 1)
      sed -i "s/\bid=/&${filename}/" "system-connections/${filename}-PUREVPN" #id
      sed -i "s/\buuid=/&${uuid}/" "system-connections/${filename}-PUREVPN" #uuid
      sed -i "s/\bport=/&${port}/" "system-connections/${filename}-PUREVPN" #port
      sed -i "s/\bremote=/&$host:${port}/" "system-connections/${filename}-PUREVPN" #host
    done
  done
  
  rm system-connections/TEST-*

  msg2 "Done."
}

package() {
  install -dm755 "${pkgdir}"/usr/bin
  install -D -m 700 "${startdir}/purevpn" "${pkgdir}"/usr/bin

  cd "${srcdir}"

  install -dm755 "${pkgdir}"/etc/NetworkManager/system-connections
  install -D -m 600 vpn-configs/system-connections/* "${pkgdir}"/etc/NetworkManager/system-connections
  
  install -dm755 "${pkgdir}"/etc/openvpn
  install -D -m 644 {ca.crt,Wdc.key} "${pkgdir}/etc/openvpn"
}

