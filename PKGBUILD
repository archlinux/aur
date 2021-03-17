# Maintainer: Premysl Srubar <premysl.srubar[äT]gmail(.)com>
pkgbase=fake-background-webcam-git
_pkgname="${pkgbase%-git}"
        
pkgname=('fake-background-webcam-git' 'fake-background-bodypix-git')           
pkgver=r135.c55bb03
pkgrel=1
pkgdesc="Virtual background-replacing camera"
#optdepends=('cuda: for GPU acceleration of the TensorFlow on NVidia cards')
arch=('x86_64')
url="https://github.com/fangfufu/Linux-Fake-Background-Webcam"
license=("GPL")
makedepends=('git' 'npm')

source=("${pkgname}::git+${url}.git" 
        'fake-background-bodypix.service' 
        'fake-background-webcam@.service'
        'readme.md'
        "$_pkgname.install")
        
sha256sums=('SKIP'
            '24827ce9ae57cc11472c26ef4dc8edfa3218250a4ff6bba424f24bfe0eed3cb2'
            '9e8b5fb7fece0b1d2809b5dcb880419e85035f80f8fcaefc9cf9fe56017bf4d9'
            'f6b37aff68926eb16c510db56df665ec2a3f8aa7348c0e8ddf247bcaa770a955'
            'b57c70f3b498d646d8834d770d806219b306251c908cc8591b0d711e3638916f')

install=$_pkgname.install            
            
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package_fake-background-webcam-git() {
  depends=('v4l2loopback-dkms' 'python' 'akvcam-dkms' 'opencv' 'python-numpy>=1.18.2' 'python-requests>=2.23.0' 'python-requests-unixsocket' 'python-aiohttp>=3.6.2' 'python-pyfakewebcam' 'fake-background-bodypix')
  provides=('fake-background-webcam')
  conflicts=('fake-background-webcam') 
  cd "$srcdir/${pkgbase}/fakecam"  
  install -d "$pkgdir/usr/lib/$_pkgname"
  install -Dm644 *.py "$pkgdir/usr/lib/$_pkgname"
  
  install -d "$pkgdir/var/lib/$_pkgname/default"
  install -Dm644 *.jpg *.png "$pkgdir/var/lib/$_pkgname/default"
  install -Dm644 "${srcdir}/fake-background-webcam@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"
  
  install -v -m 644 -D "${srcdir}/readme.md" "${pkgdir}/usr/share/doc/${_pkgname}/readme.md"  
}


package_fake-background-bodypix-git() {  
  provides=('fake-background-bodypix')
  conflicts=('fake-background-bodypix') 
  
  install -Dm644 "${srcdir}/fake-background-bodypix.service" "$pkgdir/usr/lib/systemd/system/fake-background-bodypix.service"
  
  #./install.sh
  mkdir -p "${pkgdir}/usr/lib/node_modules"  
  
  cd "$srcdir/${pkgbase}/bodypix"    
  rm Dockerfile*
  npm pack .
  npm install --user root -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" *.tgz
  rm bodypix-*.tgz
  
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
    
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \;
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${srcdir}||" -i {} \;
  
  
}
