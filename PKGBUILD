# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: Robosky <fangyuhao0612 at gmail dot com>
pkgname=anbox-image-gapps
pkgver=2018.07.19
pkgrel=10
pkgdesc="Android image for running in Anbox, with Opengapps and houdini"
arch=('x86_64')
url="https://anbox.io"
license=('custom')
makedepends=('curl' 'lzip' 'squashfs-tools' 'unzip')
optdepends=('anbox-bridge: Enable network for anbox.')
provides=('anbox-image')
conflicts=('anbox-image')

# anbox image
source=("https://build.anbox.io/android-images/${pkgver//./\/}/android_amd64.img")

# opengapps
_OPENGAPPS_RELEASEDATE="$(curl -s https://api.github.com/repos/opengapps/x86_64/releases/latest | head -n 10 | grep tag_name | grep -o "\"[0-9][0-9]*\"" | grep -o "[0-9]*")"
_OPENGAPPS_FILE="open_gapps-x86_64-7.1-mini-${_OPENGAPPS_RELEASEDATE}.zip"
_OPENGAPPS_URL="https://github.com/opengapps/x86_64/releases/download/${_OPENGAPPS_RELEASEDATE}/${_OPENGAPPS_FILE}"
source+=("${_OPENGAPPS_URL}")

# houdini
source+=("houdini_y.sfs::http://dl.android-x86.org/houdini/7_y/houdini.sfs"
	"houdini_z.sfs::http://dl.android-x86.org/houdini/7_z/houdini.sfs")

# libhoudini
source+=("https://github.com/Rprop/libhoudini/raw/master/4.0.8.45720/system/lib/libhoudini.so")

noextract=('android_amd64.img'
	"${_OPENGAPPS_FILE}"
	'houdini_y.sfs'
	'houdini_z.sfs'
	'libhoudini.so')
sha256sums=('6b04cd33d157814deaf92dccf8a23da4dc00b05ca6ce982a03830381896a8cca'
            '552e78b197551e94ed78c405fc5d0660239791c99b81bbb2fd651c4e5c309593'
            '56fd08c448840578386a71819c07139122f0af39f011059ce728ea0f3c60b665'
            '7eedc42015e6fb84a11a406a099241efccc20d4e020d476335a5fdb6e69a33d2'
            '2d15d126e46ea933a92fcc6dd30ad2c93d063af322fc1ba84aaa4f3e75d84e68')

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

	cp -r ./$(find opengapps -type d -name "PrebuiltGmsCore")			./squashfs-root/system/priv-app/
	cp -r ./$(find opengapps -type d -name "GoogleLoginService")		./squashfs-root/system/priv-app/
	cp -r ./$(find opengapps -type d -name "Phonesky")					./squashfs-root/system/priv-app/
	cp -r ./$(find opengapps -type d -name "GoogleServicesFramework")	./squashfs-root/system/priv-app/

	# load houdini_y
	mkdir -p houdini_y
	unsquashfs -f -d ./houdini_y ./houdini_y.sfs

	cp -r ./houdini_y/houdini ./squashfs-root/system/bin/
	cp -r ./houdini_y/xstdata ./squashfs-root/system/bin/
	cp ./libhoudini.so ./squashfs-root/system/lib/
	
	mkdir -p ./squashfs-root/system/lib/arm
	cp -r ./houdini_y/linker ./squashfs-root/system/lib/arm/
	cp -r ./houdini_y/*.so ./squashfs-root/system/lib/arm/
	cp -r ./houdini_y/nb ./squashfs-root/system/lib/arm/
	
	# load houdini_z
	mkdir -p houdini_z
	unsquashfs -f -d ./houdini_z ./houdini_z.sfs

	cp -r ./houdini_z/houdini64 ./squashfs-root/system/bin/
	cp ./libhoudini.so ./squashfs-root/system/lib64/
	
	mkdir -p ./squashfs-root/system/lib/arm64
	cp -r ./houdini_z/linker64 ./squashfs-root/system/lib/arm64/
	cp -r ./houdini_z/*.so ./squashfs-root/system/lib/arm64/
	cp -r ./houdini_z/nb ./squashfs-root/system/lib/arm64/

	# add houdini parser
	mkdir -p ./squashfs-root/system/etc/binfmt_misc
	echo ':arm_exe:M::\x7f\x45\x4c\x46\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28::/system/bin/houdini:' >> ./squashfs-root/system/etc/binfmt_misc/arm_exe
	echo ':arm_dyn:M::\x7f\x45\x4c\x46\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x28::/system/bin/houdini:' >> ./squashfs-root/system/etc/binfmt_misc/arm_dynp 
	echo ':arm64_exe:M::\x7f\x45\x4c\x46\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7::/system/bin/houdini64:' >> ./squashfs-root/system/etc/binfmt_misc/arm64_exe
	echo ':arm64_dyn:M::\x7f\x45\x4c\x46\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\xb7::/system/bin/houdini64:' >> ./squashfs-root/system/etc/binfmt_misc/arm64_dynp

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

    # set processors
    sed -i "/^ro.product.cpu.abilist=x86_64,x86/ s/$/,armeabi-v7a,armeabi,arm64-v8a/" ./squashfs-root/system/build.prop
    sed -i "/^ro.product.cpu.abilist32=x86/ s/$/,armeabi-v7a,armeabi/" ./squashfs-root/system/build.prop
    sed -i "/^ro.product.cpu.abilist64=x86_64/ s/$/,arm64-v8a/" ./squashfs-root/system/build.prop

    echo "persist.sys.nativebridge=1" >> ./squashfs-root/system/build.prop

    # enable opengles
    echo "ro.opengles.version=131072" >> ./squashfs-root/system/build.prop
}

package() {
	cd "${srcdir}"
	
	# set owner
	chown -R 100000:100000 ./squashfs-root/system/priv-app/{Phonesky,GoogleLoginService,GoogleServicesFramework,PrebuiltGmsCore}
	chown -R 100000:100000 ./squashfs-root/system/bin/{xstdata,houdini,houdini64}
	chown -R 100000:100000 ./squashfs-root/system/lib/{libhoudini.so,arm,arm64}
	chown -R 100000:100000 ./squashfs-root/system/lib64/libhoudini.so
	chown -R 100000:100000 ./squashfs-root/system/etc/binfmt_misc

    # squash image
    cd "${srcdir}"
    mksquashfs squashfs-root android.img -b 131072 -comp xz -Xbcj x86
    
    #install image	
	install -Dm644 ./android.img "${pkgdir}/"var/lib/anbox/android.img
}
    
