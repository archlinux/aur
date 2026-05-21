# Maintainer: Priyanshu
    pkgname=wipeforge-git
    pkgver=0.1.0.r0.g1234567 # Will be updated dynamically by pkgver()
    pkgrel=1
    pkgdesc="Secure Disk Destruction Tool"
    arch=('any')
    url="https://github.com/Priyanshu-200607/Wipe-Forge"
    license=('GPL3')
    depends=('python' 'python-textual' 'python-pyudev' 'python-psutil' 'hdparm' 'nvme-cli')
    makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
    provides=('wipeforge')
    conflicts=('wipeforge')
    source=("${pkgname}::git+https://github.com/Priyanshu-200607/Wipe-Forge.git#branch=main")
    sha256sums=('SKIP')
  
    pkgver() {
      cd "${pkgname}"
      if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
      else
        printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
      fi
    }
  
    build() {
      cd "${pkgname}"
      python -m build --wheel --no-isolation
    }
  
    package() {
      cd "${pkgname}"
      python -m installer --destdir="$pkgdir" dist/*.whl
      install -dm755 "$pkgdir/var/log/wipeforge"
    }
