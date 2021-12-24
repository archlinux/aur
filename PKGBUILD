# Maintainer: NebulaNeko <chfsefefgesfen foxmail>

_pkgname=qiandao
pkgname=${_pkgname}-git
pkgver=20211217.r15.g88dec22
pkgrel=1
pkgdesc='一个自动签到框架 base on an HAR editor。基于 binux/qiandao 进行修改，添加完善功能。'
arch=('any')
url='https://github.com/qiandao-today/qiandao/'
license=('MIT')
makedepends=('python-setuptools' 'git')
depends=('python-certifi' 'python-chardet' 'python-charset-normalizer' 'python-croniter'
         'python-deprecated' 'python-idna' 'python-incremental' 'python-jinja'
         'python-markupsafe' 'python-mysql-connector' 'python-pbkdf2' 'python-protobuf'
         'python-pycryptodome' 'python-dateutil' 'python-pytz' 'python-redis' 'python-requests'
         'python-six' 'python-tornado' 'python-u-msgpack' 'python-urllib3' 'python-wrapt'
         'python-pysocks' 'python-faker')
backup=('etc/qiandao/config.py')
source=('qiandao::git+https://github.com/qiandao-today/qiandao.git'
        '0000-change_default_database_path.patch'
        'qiandao.service'
        'sysusers.d'
        'tmpfiles.d')
install='qiandao-git.install'
sha512sums=('SKIP'
            '0e7ccf0b12e73cf5f5fd2f2f4690bd246e49dfa76d440bab9d30621096d390177b518de4061c0e63773f7192c9321c87c2b86e5f98cf96983630431a03a8fd6f'
            '660abc6b40cfaa2cef978e259d77a92c725fb1b05a535ebe32a4f07c56bb8f4fede15703d9d2ed09cc11f7ac26371235d12a97895a4e5d8b15e43b912c010ce4'
            '8ddb47713d903da752a8c601df4b9cc46b3ce23ce922436f27dac9b54fb36164b1d4f2026c13f7508e56c9f2df532c7ccc2f986e5007d3a76b04d82f4a983a4c'
            'd54af81eddb8ceb490e099258305c3f4687b80279acb2e22139cb0793b8a7d2261ac8b5fb19f36c4070ac7743bde7a3bb4808ca707c81310abd1af6c24334cd5')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  patch -p1 -i ../0000-change_default_database_path.patch
}

build(){
  python -O -m compileall "${_pkgname}"
}

package() {
  install -dm755 "${pkgdir}/usr/share/webapps/${_pkgname}"
  cp -a ${_pkgname}/* "${pkgdir}/usr/share/webapps/${_pkgname}" 
  install -Dm644 "${_pkgname}/config.py" "${pkgdir}/etc/qiandao/config.py"
  ln -sf "/etc/qiandao/config.py" "${pkgdir}/usr/share/webapps/${_pkgname}/config.py"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/${_pkgname}/run.py" "${pkgdir}/usr/bin/qiandao-run"
  ln -s "/usr/share/webapps/${_pkgname}/chrole.py" "${pkgdir}/usr/bin/qiandao-chrole"
  ln -s "/usr/share/webapps/${_pkgname}/qiandao.py" "${pkgdir}/usr/bin/qiandao-cli"

  install -Dm644 qiandao.service "${pkgdir}/usr/lib/systemd/system/qiandao.service"
  install -Dm644 tmpfiles.d "${pkgdir}/usr/lib/tmpfiles.d/qiandao.conf"
  install -Dm644 sysusers.d "${pkgdir}/usr/lib/sysusers.d/qiandao.conf"
}
