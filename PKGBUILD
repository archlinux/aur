# Maintainer: Ashley Whetter <(firstname) at awhetter couk>

# Note: You will need to start the sesinetd service before running houdini
# Note: You may want to add /opt/houdini/bin to your PATH

pkgname=('houdini' 'houdini-maya-engine' 'houdini-unity-engine' 'python2-hqueue')
pkgbase=houdini
_pkgver_major=16
_pkgver_minor=5
_pkgver_build=323
pkgver=${_pkgver_major}.${_pkgver_minor}.${_pkgver_build}
pkgrel=1
pkgdesc="High-end 3D animation package"
arch=('x86_64')
url="http://www.sidefx.com/"
license=('Custom: Side Effects Software')
depends=()
makedepends=()
options=('!strip')

_gccver=$(gcc -dumpversion)
_gccver=${_gccver%.[0-9]*}
_validgccs=(4.8)
# Use the latest gcc version available if there isn't a known version installed
[[ ${_validgccs[@]} =~ $_gccver ]] || _gccver=${_validgccs[@]:(-1)}

# The file needs to be downloaded manually
source=(file://${pkgname}-${pkgver}-linux_x86_64_gcc${_gccver}.tar.gz)
[[ "$_gccver" == 4.8 ]] && sha1sums=('33ca8891d7cc127953c4272ecbbeab82974f4a08')

source+=('LICENSE' 'sesinetd.service')
sha1sums+=('25317e6850d453e86f8bc868efe1ef95f81a2174' 'b6eca8f67aeedb9c5b7a5863c3d24edaf2b93cf3')

_install_houdini_file() {
	# From installDesktopItems.py:__installHoudiniFile
	src="$1"
	dest="$2"
	sed -i '
	s|${HFS}|/opt/houdini|g
	s|${VER_MAJOR}|'${_pkgver_major}'|g
	s|${VER_MINOR}|'${_pkgver_minor}'|g
	' "$src"
	install -Dm644 "$src" "$dest"
}

package_houdini() {
	depends=(
	'expat' 'fontconfig' 'glu' 'icu' 'libx11' 'libglvnd' 'ocl-icd' 'python2-mako'
	)
	optdepeds=(
	'alsa-lib: Audio support'
	'ilmbase: OpenEXR file format support'
	'python2-flask: In application documentation browser'
	'python2-pygments: In application documentation browser'
	)

	cd ${srcdir}/houdini-${pkgver}-linux_x86_64_gcc${_gccver}

	install -d ${pkgdir}/opt/houdini
	tar xzf houdini.tar.gz -C ${pkgdir}/opt/houdini

	for i in {gplay,hkey,houdini,houdinifx,houdinicore,hindie,mplay,hview,happrentice,orbolt_url};
	do
		_install_houdini_file desktop/sesi_${i}.desktop ${pkgdir}/usr/share/applications/sesi_${i}.desktop
	done

	_install_houdini_file desktop/sesi_houdini.menu ${pkgdir}/etc/xdg/menus/applications-merged/sesi_houdini.menu

	_install_houdini_file desktop/sesi_houdini.menu ${pkgdir}/etc/xdg/menus/kde-applications-merged/sesi_houdini.menu

	for i in {hip,hiplc,hipnc,otl,otllc,otlnc,hda,hdalc,hdanc,pic,piclc,picnc,geo,bgeo,orbolt}
	do
		_install_houdini_file "mime/application-x-${i}.xml" "${pkgdir}/usr/share/mime/packages/application-x-${i}.xml"
	done

	# installing license
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE

	install -Dm644 ${srcdir}/sesinetd.service ${pkgdir}/usr/lib/systemd/system/sesinetd.service
}

package_houdini-maya-engine() {
	url="https://www.sidefx.com/products/houdini-engine/maya-plug-in/"
	depends=("houdini=$pkgver")

	cd ${srcdir}/houdini-${pkgver}-linux_x86_64_gcc${_gccver}

	install -d ${pkgdir}/opt/houdini/engine/maya
	tar xzf engine_maya.tar.gz -C ${pkgdir}/opt/houdini/engine/maya

	sed -i -e 's|REPLACE_WITH_HFS|/opt/houdini|' \
		$(find "${pkgdir}/opt/houdini/engine/maya" -mindepth 2 -maxdepth 2 -type f -name "houdiniEngine-*")

	for maya_version in {2014,2015,2016,2016.5,2017,2018}
	do
		if [[ $maya_version == 2014 || $maya_version == 2015 ]]
		then
			maya_dir="${pkgdir}/usr/autodesk/maya${maya_version}-x64"
		else
			maya_dir="${pkgdir}/usr/autodesk/maya${maya_version}"
		fi
		module_dir="${maya_dir}/modules"
		install -d "$module_dir"
		cp ${pkgdir}/opt/houdini/engine/maya/maya${maya_version}/houdiniEngine-maya${maya_version} "$module_dir"
	done

	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

package_houdini-unity-engine() {
	url="https://www.sidefx.com/products/houdini-engine/unity-plug-in/"
	depends=("houdini=$pkgver")

	cd ${srcdir}/houdini-${pkgver}-linux_x86_64_gcc${_gccver}

	install -d ${pkgdir}/opt/houdini/engine/unity
	tar xzf engine_unity.tar.gz -C ${pkgdir}/opt/houdini/engine/unity

	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

package_python2-hqueue() {
	depends=('mysql' 'python2>=2.7' 'python2-beaker' 'python2-decorator' 'python2-formencode' 'python2-mako' 'python2-nose' 'python2-paramiko' 'python2-paste' 'python2-paste-deploy' 'python2-paste-script' 'python2-crypto' 'python2-pycurl' 'python2-pygments' 'python2-pylons' 'python2-routes' 'python2-rpyc' 'python2-setuptools' 'python2-simplejson' 'python2-sqlalchemy' 'python2-tempita' 'python2-virtualenv' 'python2-weberror' 'python2-webhelpers' 'python2-webob' 'python2-webtest' 'python2-wsgiref')

	cd ${srcdir}/houdini-${pkgver}-linux_x86_64_gcc${_gccver}
	tar xzf hqueue.tar.gz

	for file in {hqserverd,create_shared_drive.sh}
	do
		install -Dm755 hqueue/scripts/$file ${pkgdir}/opt/hqueue/scripts/$file
	done

	sed -i -e 's|%%INSTALL_DIR%%|/opt/hqueue|' ${pkgdir}/opt/hqueue/scripts/hqserverd

	# TODO: hqueue/deps/indep/*
	# TODO: Convert hqueue/scripts/hqserverd to systemd unit
	install -d ${pkgdir}/usr/lib/python2.7/site-packages
	install -Dm644 hqueue/hqserver-${pkgver}-py2.7.egg ${pkgdir}/usr/lib/python2.7/site-packages
	echo ./hqserver-${pkgver}-py2.7.egg >> ${pkgdir}/usr/lib/python2.7/site-packages/hqserver.pth
}
