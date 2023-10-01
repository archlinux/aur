pkgbase="rt-env"
pkgname="rt-env-git"
pkgver=1.1.2.225.3521
pkgrel=1
pkgdesc="RT_Thread env!"
arch=("x86_64")
license=("Apache-2.0" "GPL-2.0")
depends=('git' 'scons' 'python')
url="https://github.com/RT-Thread/env"

source=(env::git+https://github.com/RT-Thread/env.git
	packages::git+https://github.com/RT-Thread/packages.git)
sha512sums=('SKIP'
            'SKIP')

_env_root="/opt/rt-thread/tools/env"
_env_cmd_root="${_env_root}/tools/scripts"
_pkgs_root="${_env_root}/packages/packages"

pkgver() {
	_envver=`cd env && git describe --long --tags | sed 's/-/\./g; s/^v//; s/g.*$//'`
	_packagesver=`cd packages && git rev-list --count HEAD`
	echo $_envver$_packagesver
}

build() {
	mkdir -p "${srcdir}${_pkgs_root}"
	mkdir -p "${srcdir}${_env_cmd_root}"
	mkdir -p "${srcdir}${_env_root}/local_pkgs"
	cp -r ${srcdir}/env/* "${srcdir}${_env_cmd_root}"
	cp -r ${srcdir}/packages/* "${srcdir}${_pkgs_root}"
	echo 'source "$PKGS_DIR/packages/Kconfig"' > ${srcdir}${_pkgs_root}/../Kconfig
	echo 'export PATH='${_env_root}'/tools/scripts:$PATH' > "${srcdir}${_env_root}/env.sh"
}

package() {
	install -d -m755 "${pkgdir}${_env_root}"
	cp -rf ${srcdir}${_env_root}/* "${pkgdir}${_env_root}"
	_lnenv=${HOME}/.env
	echo "if [ \"\`readlink ${_lnenv}\`\" == \"${_env_root}\" ];then exit 0; fi;
if [ -L ${_lnenv}  ] || [ -d ${_lnenv}  ];
	then rm -rf ${_lnenv}-old; mv ${_lnenv} ${_lnenv}-old; fi;
ln -s ${_env_root} ${_lnenv}" > "${pkgdir}${_env_root}/lnenv.sh"
	chown -R $USER:`id -g -n $USER` ${pkgdir}${_env_root}
}

(
    echo "post_install() {"
	echo 'echo "** -------------------------------------------------------------------------- **"'
	echo "echo \"**        The following command is to generate a linked file to ~/.env !      **\""
	echo "echo \"**         The main purpose is to unify with official usage methods !         **\""
	echo "echo \"**  Note: This command may delete the ~/.env-old file. Be sure to backup it!  **\""
	echo 'echo "** -------------------------------------------------------------------------- **"'
	echo "echo \"** ----------- please execute   ${_env_root}/lnenv.sh ----------- **\""
	echo 'echo "** -------------------------------------------------------------------------- **"'
    echo "}"
) > "${startdir}/${pkgname}.install"
true && install="${pkgname}.install"
