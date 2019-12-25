# Maintainer: Jack Chen <redchenjs at live dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Robosky <fangyuhao0612 at gmail dot com>
pkgname=anbox-image-gapps
pkgver=2018.07.19
pkgrel=12
pkgdesc="Android image for running in Anbox, with OpenGApps and houdini"
arch=('x86_64')
url="https://anbox.io"
license=('custom')
makedepends=('curl' 'lzip' 'squashfs-tools' 'unzip')
provides=('anbox-image')
conflicts=('anbox-image')

# anbox image
source=("https://build.anbox.io/android-images/${pkgver//./\/}/android_amd64.img")

# opengapps
_OPENGAPPS_RELEASEDATE="$(curl -s https://api.github.com/repos/opengapps/x86_64/releases/latest | head -n 10 | grep tag_name | grep -o "\"[0-9][0-9]*\"" | grep -o "[0-9]*")"
_OPENGAPPS_FILE="open_gapps-x86_64-7.1-mini-${_OPENGAPPS_RELEASEDATE}.zip"
_OPENGAPPS_URL="https://downloads.sourceforge.net/project/opengapps/x86_64/${_OPENGAPPS_RELEASEDATE}/${_OPENGAPPS_FILE}"
source+=("${_OPENGAPPS_URL}")
source+=("${_OPENGAPPS_URL}.md5")

# houdini
source+=("houdini_y.sfs::http://dl.android-x86.org/houdini/7_y/houdini.sfs"
         "houdini_z.sfs::http://dl.android-x86.org/houdini/7_z/houdini.sfs")

noextract=("${_OPENGAPPS_FILE}")
md5sums=('26874452a6521ec2e37400670d438e33'
         'SKIP'
         'SKIP'
         '7ebf618b1af94a02322d9f2d2610090b'
         '5ca37e1629edb7d13b18751b72dc98ad')

prepare() {
	# verify OpenGApps against provided md5 file
	if [ `md5sum "${_OPENGAPPS_FILE}" | awk '{print $1}'` = `cat "${_OPENGAPPS_FILE}".md5 | awk '{print $1}'` ]
	then
		echo 'OpenGApps md5sums passed'
	else
		echo 'WARNING: OpenGApps md5sums failed!'
		exit 1
	fi
}

build () {
	cd "${srcdir}"

	# unsquash anbox image
	unsquashfs android_amd64.img

	# install opengapps
	unzip -d opengapps ./${_OPENGAPPS_FILE}

	cd ./opengapps/Core/
	for filename in *.tar.lz
	do
		tar --lzip -xvf ./${filename}
	done

	cd "${srcdir}"

	cp -r ./$(find opengapps -type d -name "PrebuiltGmsCore") ./squashfs-root/system/priv-app/
	cp -r ./$(find opengapps -type d -name "GoogleLoginService") ./squashfs-root/system/priv-app/
	cp -r ./$(find opengapps -type d -name "Phonesky") ./squashfs-root/system/priv-app/
	cp -r ./$(find opengapps -type d -name "GoogleServicesFramework") ./squashfs-root/system/priv-app/

	# load houdini_y
	mkdir -p houdini_y
	rm -rf ./houdini_y/*
	unsquashfs -f -d ./houdini_y ./houdini_y.sfs

	mkdir -p ./squashfs-root/system/lib/arm
	cp -r ./houdini_y/* ./squashfs-root/system/lib/arm
	mv ./squashfs-root/system/lib/arm/libhoudini.so ./squashfs-root/system/lib/libhoudini.so

	# load houdini_z
	mkdir -p houdini_z
	rm -rf ./houdini_z/*
	unsquashfs -f -d ./houdini_z ./houdini_z.sfs

	mkdir -p ./squashfs-root/system/lib64/arm64
	cp -r ./houdini_z/* ./squashfs-root/system/lib64/arm64
	mv ./squashfs-root/system/lib64/arm64/libhoudini.so ./squashfs-root/system/lib64/libhoudini.so

	# add houdini parser
	mkdir -p ./squashfs-root/system/etc/binfmt_misc
	echo ':arm_exe:M::\x7f\x45\x4c\x46\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28::/system/lib/arm/houdini:P' >> ./squashfs-root/system/etc/binfmt_misc/arm_exe
	echo ':arm_dyn:M::\x7f\x45\x4c\x46\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x28::/system/lib/arm/houdini:P' >> ./squashfs-root/system/etc/binfmt_misc/arm_dyn
	echo ':arm64_exe:M::\x7f\x45\x4c\x46\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7::/system/lib64/arm64/houdini64:P' >> ./squashfs-root/system/etc/binfmt_misc/arm64_exe
	echo ':arm64_dyn:M::\x7f\x45\x4c\x46\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\xb7::/system/lib64/arm64/houdini64:P' >> ./squashfs-root/system/etc/binfmt_misc/arm64_dyn


	# add features
	_C=$(cat <<-END
		<feature name="android.hardware.touchscreen" />\n
		<feature name="android.hardware.audio.output" />\n
		<feature name="android.hardware.camera" />\n
		<feature name="android.hardware.camera.any" />\n
		<feature name="android.hardware.location" />\n
		<feature name="android.hardware.location.gps" />\n
		<feature name="android.hardware.location.network" />\n
		<feature name="android.hardware.microphone" />\n
		<feature name="android.hardware.screen.portrait" />\n
		<feature name="android.hardware.screen.landscape" />\n
		<feature name="android.hardware.wifi" />\n
		<feature name="android.hardware.bluetooth" />"
	END
	)

	_C=$(echo ${_C} | sed 's/\//\\\//g')
	_C=$(echo ${_C} | sed 's/\"/\\\"/g')
	sed -i "/<\/permissions>/ s/.*/${_C}\n&/" ./squashfs-root/system/etc/permissions/anbox.xml

	# make wifi and bt available
	sed -i "/<unavailable-feature name=\"android.hardware.wifi\" \/>/d" ./squashfs-root/system/etc/permissions/anbox.xml
	sed -i "/<unavailable-feature name=\"android.hardware.bluetooth\" \/>/d" ./squashfs-root/system/etc/permissions/anbox.xml

	sed -i '/^ro.product.cpu.abilist=x86_64,x86/ s/$/,arm64-v8a,armeabi-v7a,armeabi/' ./squashfs-root/system/build.prop
	sed -i '/^ro.product.cpu.abilist32=x86/ s/$/,armeabi-v7a,armeabi/' ./squashfs-root/system/build.prop
	sed -i '/^ro.product.cpu.abilist64=x86_64/ s/$/,arm64-v8a/' ./squashfs-root/system/build.prop

	# enable nativebridge
	echo "persist.sys.nativebridge=1" >> ./squashfs-root/system/build.prop
	sed -i 's/ro.dalvik.vm.native.bridge=0/ro.dalvik.vm.native.bridge=libhoudini.so/' ./squashfs-root/default.prop

	# enable opengles
	echo "ro.opengles.version=131072" >> ./squashfs-root/system/build.prop
}

package() {
	cd "${srcdir}"

	# set owner
	chown -R 100000:100000 ./squashfs-root/system/priv-app/{Phonesky,GoogleLoginService,GoogleServicesFramework,PrebuiltGmsCore}
	chown -R 100000:100000 ./squashfs-root/system/lib/{libhoudini.so,arm}
	chown -R 100000:100000 ./squashfs-root/system/lib64/{libhoudini.so,arm64}
	chown -R 100000:100000 ./squashfs-root/system/etc/binfmt_misc

	# squash image
	mksquashfs squashfs-root android.img -b 131072 -comp xz -Xbcj x86

	#install image
	install -Dm644 ./android.img "${pkgdir}/"var/lib/anbox/android.img
}

