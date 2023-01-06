# Maintainer: seiuneko <chfsefefgesfen foxmail>

_pkgname=qiandao
pkgname=${_pkgname}-git
pkgver=20220911.r11.gf92c4fb
pkgrel=1
pkgdesc='一个自动签到框架 base on an HAR editor。基于 binux/qiandao 进行修改，添加完善功能。'
arch=('any')
url='https://github.com/qiandao-today/qiandao/'
license=('MIT')
makedepends=('python-setuptools' 'git')
depends=('python-chardet' 'python-croniter' 'python-incremental' 'python-jinja'
         'python-aiomysql' 'python-pbkdf2' 'python-pycryptodome' 'python-pytz'
         'python-redis' 'python-requests' 'python-tornado' 'python-u-msgpack'
         'python-pysocks' 'python-faker' 'python-aiofiles' 'python-colorama'
         'python-croniter' 'python-sqlalchemy' 'python-passlib' 'python-aiosqlite'
         'python-cryptography')
backup=('etc/qiandao/config.py')
source=('qiandao::git+https://github.com/qiandao-today/qiandao.git'
        '0000-change_default_database_path.patch'
        '0001-add-shebang.patch'
        'qiandao.service'
        'sysusers.d'
        'tmpfiles.d')
install='qiandao-git.install'
sha512sums=('SKIP'
            '4a5bab48f57eff0d07adfcd8f0f09167b8d2779904f6e5dd0c9d0ff386c6365f3f5cac7485fbd14fc1b1997e335e639ec9fb0f6d46e05bf57d4bd0d2b2532eed'
            '2b137ac19d0eb6b08e20e34157b5697c11b8580b7ec87a48493d7f59cf2fef3b58f6259b9e181173d71e0d4e5f3070a41f9e562406e691854e8a3fd52bb591bc'
            '660abc6b40cfaa2cef978e259d77a92c725fb1b05a535ebe32a4f07c56bb8f4fede15703d9d2ed09cc11f7ac26371235d12a97895a4e5d8b15e43b912c010ce4'
            '8ddb47713d903da752a8c601df4b9cc46b3ce23ce922436f27dac9b54fb36164b1d4f2026c13f7508e56c9f2df532c7ccc2f986e5007d3a76b04d82f4a983a4c'
            'd54af81eddb8ceb490e099258305c3f4687b80279acb2e22139cb0793b8a7d2261ac8b5fb19f36c4070ac7743bde7a3bb4808ca707c81310abd1af6c24334cd5')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  patch -p1 -i ../0000-change_default_database_path.patch
  patch -p1 -i ../0001-add-shebang.patch
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
