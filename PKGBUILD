#Maintainer: Daniel Wallace < danielwallace at gtmanfred dot com>
pkgname=bastion
pkgver=20120621
_pkgver=2012-06-20
pkgrel=7
pkgdesc="An original action role-playing game set in a lush imaginative world, in which players must create and fight for civilization’s last refuge as a mysterious narrator marks their every move."
url="http://supergiantgames.com/?page_id=242"
license=('custom')
arch=('i686' 'x86_64')
groups=("humble-indie-bundleV" "games")
depends=('libxft')
makedepends=('curl')
install=$pkgname.install
PKGEXT=".pkg.tar"
source=("Bastion-HIB-${_pkgver}.sh::https://www.humblebundle.com/login"
        "Bastion-HIB-${_pkgver}.sh::http://www.humblebundle.com/downloads?key=${_humblebundleVkey}" 
        "$pkgname.desktop" 
        "mesa$pkgname" 
        "$pkgname.install")
case $CARCH in
    i686) _arch=x86 ;;
    x86_64) _arch=x86_64;;
esac

_char=\'
DLAGENTS=('https::/bin/echo %o > /tmp/arch && sed -i "s/.part//" /tmp/arch &&
 /usr/bin/curl -s --cookie-jar /tmp/cjar --output /dev/null %u && cp /tmp/cjar ./ &&
 /usr/bin/curl -sL --cookie /tmp/cjar --cookie-jar /tmp/cjar --data "username=$_humbleemail" --data "password=$_humblepassword" %u |
 grep -f /tmp/arch |grep -o -E "data-web=[^ ]+"| sed -e "s/data-web=\([^ ]*\)/\1/" > /tmp/url &&
 sed -i "s/$_char//g" /tmp/url &&
 /usr/bin/curl --cookie /tmp/cjar --cookie-jar /tmp/cjar -fLC -  --retry 3 --retry-delay 3 -o %o "$(</tmp/url)" &&
 rm -f /tmp/{arch,url} || return 0'
            "http::/usr/bin/curl -sL %u | grep Bastion-HIB | sed -e \"s/.*data-web='\([^']*\)'.*/url = \1/\" > /tmp/url && /usr/bin/curl -fLC -  --retry 3 --retry-delay 3 -o %o -K /tmp/url && rm /tmp/url")

# if [[ ! -f $SRCDEST/${source[0]%%:*} ]]; then
#     if [[ -z $_humbleemail || -z $_humblepassword ]]; then
#         if [[ -z $_humblebundleVkey ]]; then
#             msg "if you have bound your email and password to your account, "
#             msg "please export the values _humbleemail and _humblepassword so"
#             msg "that you can be logged in to download the game."
#             echo
#             msg "if you have not bound the key to an email, "
#             msg "please export _humblebundleVkey in your .bashrc"
#             return 1
#         fi
#     fi
# fi


package() {
    cd "$srcdir"
    [[ -d "$srcdir"/"$pkgname-$_pkgver" ]] && rm -r "$srcdir"/"$pkgname-$_pkgver"
    sh "${source[0]%%:*}" -u --packager pacman --nox11 --target "$srcdir"/"$pkgname-$_pkgver" --bindir "$pkgdir"/opt/games/Bastion --datadir "$pkgdir"/opt/games

	find "${pkgdir}" -type f -exec chmod 644 "{}" +
	install -Dm644 "${pkgname}".desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop
	install -Dm755 "mesa${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"mesa
	install -Dm644 "${pkgdir}"/opt/games/Bastion/Bastion.png "${pkgdir}"/usr/share/icons/"${pkgname}".png

	chmod 755 "${pkgdir}"/opt/games/Bastion/Bastion.bin."$_arch"
	ln -s "/opt/games/Bastion/Bastion.bin.$_arch" "${pkgdir}"/usr/bin/"${pkgname}"
}


md5sums=('aa6ccaead3b4b8a5fbd156f4019e8c8b'
         'aa6ccaead3b4b8a5fbd156f4019e8c8b'
         '0facce79c6d93c5914a58e096eca8c92'
         'a42e39c5f52abf19b6975cb79f732907'
         '234862600b3d8792b95eedeae28577b7')
