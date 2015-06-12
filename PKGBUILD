# Contributor: Marcel Pfeiffer <pfeiffer.marcel at gmx dot de>
# Contributor: Zachary A. Jones <JazzplayerL9@gmail.com>
# Maintaner: Jose Riha <jose1711 gmail com>

pkgname=voxatron
pkgver=0.3.2
pkgrel=1
pkgdesc="Voxatron is an action/adventure game set in a world completely made of tiny cubes that can be blasted to smithereens"
url="http://www.lexaloffle.com/voxatron.php"
license=('custom: "commercial"')
groups=('humblevoxatronbundle' 'games')
arch=('i686' 'x86_64')
case $CARCH in
    i686)
        depends=('libgl' 'sdl')
        optdepends=('alsa-lib: sound support' 'libpulse: sound support')
    ;;
    x86_64)
        depends=('lib32-libgl' 'lib32-sdl')
        optdepends=('lib32-alsa-lib: sound support' 'lib32-libpulse: sound suport')
    ;;
esac
#makedepends=('curl')
options=(!strip)

_gamepkg="${pkgname}_${pkgver}_i386.tar.gz"
source=("hib://${_gamepkg}"
        "$pkgname.desktop"
	"vox-exec")

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
#_char=\'
#DLAGENTS=('https::/bin/echo %o > /tmp/arch && sed -i "s/.part//" /tmp/arch && /usr/bin/curl -s --cookie-jar /tmp/cjar --output /dev/null %u && cp /tmp/cjar ./ && /usr/bin/curl -sL --cookie /tmp/cjar --cookie-jar /tmp/cjar --data "username=$_humbleemail" --data "password=$_humblepassword" %u | grep -f /tmp/arch |grep -o -E "data-web=[^ ]+"| sed -e "s/data-web=\([^ ]*\)/\1/" > /tmp/url && sed -i "s/$_char//g" /tmp/url && /usr/bin/curl --cookie /tmp/cjar --cookie-jar /tmp/cjar -fLC -  --retry 3 --retry-delay 3 -o %o "$(</tmp/url)" && rm -f /tmp/{arch,url} || return 0'
          #"http::/usr/bin/curl -sL %u | grep voxatron_${pkgver}_ | sed \"s/.*data-web='/url=/\" | sed \"s/' data-bt.*//\" | grep .tar.gz > /tmp/url && /usr/bin/curl -fLC -  --retry 3 --retry-delay 3 -o %o -K /tmp/url && rm /tmp/url")
#
#curl reference for update use:
#curl -sL http://www.humblebundle.com/downloads?key=${_humblevoxatronkey} | grep voxatron_${pkgver}_ | sed -e \"s/.*data-web='/url=/\" | sed -e \"s/' data-bt.*//\" | grep .tar.gz > weblinks.txt

#if [[ ! -f $SRCDEST/${source[0]%%:*} ]]; then
    #if [[ -z $_humbleemail || -z $_humblepassword ]]; then
        #if [[ -z $_humblevoxatronkey ]]; then
            #msg "if you have bound your email and password to your account, "
            #msg "please export the values _humbleemail and _humblepassword so"
            #msg "that you can be logged in to download the game."
            #echo
            #msg "if you have not bound the key to an email, "
            #msg "please export _humblevoxatronkey in your .bashrc"
            #return 1
        #fi
    #fi
#fi

package(){
  cd "${srcdir}"

  install -d "${pkgdir}/opt/${pkgname}"
  cp -R "${srcdir}"/${pkgname}/* "${pkgdir}/opt/${pkgname}/"

  # create Launcher
  install -d "${pkgdir}/usr/bin/"
  install -D -m755 "${srcdir}/vox-exec" "${pkgdir}/usr/bin/${pkgname}"
  # Install Desktop File and Icon
  install -D -m644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${pkgdir}/opt/${pkgname}/lexaloffle-vox.png" \
		"${pkgdir}/usr/share/icons/${pkgname}-icon.png"
  # Install license
  install -Dm 644 "${pkgdir}"/opt/${pkgname}/license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/license
}
md5sums=('58cbe8e1a6b8027cfdcfb16d5d61276f'
         '184c021b52d3a9c8ac5f49435b4b93e0'
         'bb84f6fcd7cdb18eb417173a6f58e00e')
