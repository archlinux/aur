# Maintainer: badcast <lmecomposer@gmail.com> 
# Contributor: Artem Izmaylov <support@aimp.ru>

pkgname=aimp
pkgver=5.10
pkgrel=2414
url="https://www.aimp.ru/"
pkgdesc="AIMP (on Wine) is powerful free audio player."
arch=('x86_64')
license=('custom')
depends=('wine') 
source=("https://www.aimp.ru/files/linux/aimp_${pkgver}-${pkgrel}_amd64.deb")
md5sums=('e56fc3e3db95d2baf5160956057cca46')

build(){
   cd "${srcdir}"
   
   echo "Append aimp (shell):/usr/bin/aimp"
   #save patch
   echo "#!/usr/bin/sh
#Convert Linux paths to Windows paths. 
#Example:
#GNU LINUX | WINDOWS OS
#    \$HOME = %USERPROFILE%\\ (etc).
_paths=$(winepath --windows \"\$@\")
/usr/bin/wine start /unix '/opt/aimp/AIMP/AIMP.exe' \${_paths}" > aimp 
}

package(){
   desktopfile="aimp.desktop"
   dest="$pkgdir/opt/aimp"
   cd "${srcdir}"
   
   #extract sources
   bsdtar -xf "data.tar.gz" -C "${pkgdir}"

   #set a prompt mode +x
   chmod +x "$pkgdir/opt/aimp/${desktopfile}"

   rm -f "$dest/${desktopfile}"
   rm -f "$dest/aimp.bash"
   
   #fix owner bug's 
   #append Desktop.file
   install -Dm644 ../${desktopfile} "$pkgdir/usr/share/applications/${desktopfile}"
   
   install -Dm755 aimp "$pkgdir/usr/bin/aimp"
}
