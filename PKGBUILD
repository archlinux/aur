
# Maintainer: Premysl Srubar <premysl.srubar[äT]gmail(.)com>
pkgbase=fake-background-webcam-git
_pkgname="${pkgbase%-git}"
        
pkgname=('fake-background-webcam-git')
pkgver=r248.ba10079
pkgrel=1
pkgdesc="Virtual background-replacing camera"
#'python-cmapy>=0.6.6'
depends=('v4l2loopback-dkms' 
         'python'
         'python-opencv>=4.4.0.46'
         'opencv'
         'python-numpy>=1.19.3'
         'python-requests>=2.23.0'
         'python-requests-unixsocket'
         'python-aiohttp>=3.6.2'
         'python-inotify-simple>=1.2'
         'python-pyfakewebcam'
         'python-mediapipe'
         'python-configargparse'
         'python-cmapy')
backup=("etc/$_pkgname/config.ini")

provides=('fake-background-webcam')
conflicts=('fake-background-webcam') 
arch=('x86_64')
url="https://github.com/fangfufu/Linux-Fake-Background-Webcam"
license=("GPL")
makedepends=('git')

source=("${pkgname}::git+${url}.git" 
        'fake-background-webcam@.service'
        'readme.md'
        "$_pkgname.install"
        'config.ini')
        
sha256sums=('SKIP'
            'b5aaa8e9c45687b5e61b9691d7de1c41b54392d9ed66a9177be1dbe0ed4edf6a'
            'f4ddf1a2ee79663696d645a82f2ba1f2c07c91d1d9e1e6286ad93e7ab2ee3461'
            'b57c70f3b498d646d8834d770d806219b306251c908cc8591b0d711e3638916f'
            '82a6ea84a0f1246ca11f058a88b83854d6ecb268fb2331a4a186b9b01920bfc9')

install=$_pkgname.install            
            
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package_fake-background-webcam-git() {
  
  # Config
  install -d "$pkgdir/etc/$_pkgname"
  install -Dm644 config.ini "$pkgdir/etc/$_pkgname"
  
  cd "$srcdir/${pkgbase}"
  # App
  install -d "$pkgdir/usr/lib/$_pkgname"
  install -Dm644 *.py "$pkgdir/usr/lib/$_pkgname"

  # Default background files
  install -d "$pkgdir/var/lib/$_pkgname/default"  
  install -Dm644 *.jpg *.png "$pkgdir/var/lib/$_pkgname/default"

  # Systemd
  install -Dm644 "${srcdir}/fake-background-webcam@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"

  # Misc
  install -v -m 644 -D "${srcdir}/readme.md" "${pkgdir}/usr/share/doc/${_pkgname}/readme.md"  
}
