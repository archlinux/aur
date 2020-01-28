# Maintainer: Grey Christoforo <first name at last name dot net>

## This PKGBUILD creates an Arch Linux package for the proprietary MATLAB application.
## In order to build the package, the user must supply:
## 1) a plain text file installation key as file `matlab.fik`
## and
## 2) the software tarball as `matlab.tar` from MATLAB ISO image or as downloaded by the installer
## A typical matlab tarball structure looks like this:
#matlab.tar
#├── activate.ini*
#├── archives/
#│   ├── common/
#│   └── glnxa64/
#│       ├── matlab/
#│       ├── matlab_code_analyzer/
#│       ├── matlabconnector/
#│       ├── matlabdata/
#│       ├── matlab_desktop_glnxa64_1535004605.enc*
#│       ├── matlab_desktop_glnxa64_1535004605.xml*
#│       ├── ... other toolbox/product files & folders go here 
#├── bin/
#├── help/
#├── install*
#├── installer_input.txt*
#├── install_guide.pdf*
#├── java/
#├── license_agreement.txt*
#├── patents.txt*
#├── readme.txt*
#├── sys/
#├── trademarks.txt*
#├── ui/
#└── VersionInfo.xml*

## Maybe you'd create this archive like this:
## tar -cvf matlab.tar -C ~/matlab_R2019b_glnxa64/ .

## You can get your file installation key (that you must manually put into matlab.fik) from https://mathworks.com/licensecenter
## Then maybe you could make the matlab.fik file you need for this package like this:
## echo "xxxxx-xxxxx-xxxxx-xxxxx-..." > matlab.fik

## This PKGBUILD no longer attempts to activate the product.
## The user will be prompted to undertake their activation method of choice when the GUI is first run.
## Activation could be automated by running /opt/matlab/bin/activate_matlab.sh after this package is installed.
## Activation could be further automated in matlab.install (a file that doesn't exist at this time)

## This package will conflict with /usr/bin/mex from texlive-bin
## You could fix that by installing it with the pacman option --overwrite /usr/bin/mex
## /ust/bin/mex from texlive-bin is just a symlink

# partial install
_partialinstall=false

pkgname=matlab
_install_dir="/opt/${pkgname}"
# as of R2019b Update 3, MATLAB's version number is:
pkgver=9.7.0.1261785
pkgrel=1
pkgdesc='A high-level language for numerical computation and visualization'
arch=('x86_64')
url='http://www.mathworks.com'
license=(custom)
makedepends=('gendesk')
depends=('gconf'
         'glu'
         'gstreamer0.10-base'
         'gtk2'
         'libunwind'
         'libxp'
         'libxpm'
         'libxtst'
         'nss'
         'portaudio'
         'python'
         'qt5-svg'
         'qt5-webkit'
         'qt5-websockets'
         'qt5-x11extras'
         'xerces-c')
optdepends=('gcc6: For MEX support')

source=("local:///matlab.tar"
	"local:///matlab.fik")
md5sums=("SKIP" "SKIP")
PKGEXT='.pkg.tar'

OPTIONS=(!strip staticlibs)

prepare() {
	msg2 'Generating .desktop launcher file'
	gendesk -f -n --pkgname "${pkgname}" \
		--pkgdesc "${pkgdesc}" \
		--categories "Development;Education;Science;Mathematics;IDE" \
	        --exec "${_install_dir}/bin/matlab -desktop"

	msg2 'Reading file installation key from matlab.fik'
	_fik=$(grep -o [0-9-]* matlab.fik)

	msg2 'Modifying the installer settings'
	sed -i "s,^# destinationFolder=,destinationFolder=${pkgdir}${_install_dir}," installer_input.txt
	sed -i "s,^# agreeToLicense=,agreeToLicense=yes," installer_input.txt
	sed -i "s,^# mode=,mode=silent," installer_input.txt
	sed -i "s,^# outputFile=,outputFile=${srcdir}/installer_output.txt," installer_input.txt
	sed -i "s,^# fileInstallationKey=,fileInstallationKey=${_fik}," installer_input.txt

	if [ ! -z ${_products+isSet} ]; then
	msg2 'Building a package with a subset of the licensed products.'
	for _product in "${_products[@]}"; do
		sed -i "/^#product.${_product}$/ s/^#//" installer_input.txt
	done
	fi
}

package() {
	msg2 'Starting MATLAB installer'
	## I assume it's a bad idea, but I had to unset a few vars to prevent
	## fakeroot from slowing the matlab installer to a crawl (commented out by default)
	#LDLP=${LD_LIBRARY_PATH}
	#LDP=${LD_PRELOAD}
	#unset LD_LIBRARY_PATH
	#unset LD_PRELOAD
	./install -t -inputFile "${srcdir}/installer_input.txt"
	#export LD_LIBRARY_PATH="$LDLP"
	#export LD_PRELOAD="$LDP"

	if [ $? -eq 0 ]; then
		msg2 'Matlab installer done without error'
	else
		meg2 'Error encountered while running matlab installer'
	fi

	msg2 'Installing license agreement file'
	install -D -m644 "${pkgdir}${_install_dir}/license_agreement.txt" "${pkgdir}/usr/share/licenses/tmw/${pkgname}/LICENSE"

	#msg2 'Creating links for license.dat'
	#mv "${pkgdir}${_install_dir}/licenses" "${pkgdir}${_install_dir}/licenses.bak"
	#ln -s "/etc/matlab/licenses/" "${pkgdir}${_install_dir}/licenses"

	msg2 'Creating links for executables'
	install -d -m755 "${pkgdir}/usr/bin/"
	for _executable in deploytool matlab mbuild mcc mex; do
		ln -s "${_install_dir}/bin/${_executable}" "${pkgdir}/usr/bin/${_executable}"
	done

	msg2 'Installing .desktop launcher files'
	install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${pkgdir}${_install_dir}/help/matlab/matlab_env/matlab_desktop_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

if ${_partialinstall} && [ -z ${_products+isSet} ]; then
	_products=(
		"MATLAB"
		#"Curve_Fitting_Toolbox"
		# fill in toolboxes/products here as needed for a partial install
		# hint: look in your installer_input.txt file for names to use here
		)
fi
