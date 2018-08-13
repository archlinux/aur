# Maintainer: Grey Christoforo <first name at last name dot net>
# Maintainer: Darcy Hu <hot123tea123@gmail.com>

## This PKGBUILD creates an Arch Linux package for the proprietary MATLAB application.
## In order to build the package the user must supply a plain text file installation key as file `matlab.fik`, the license file as `matlab.lic`, the software tarball as `matlab.tar` from MATLAB ISO image.
## To perform a network install set $_networkinstall to true.

_networkinstall=false

# partial install
_partialinstall=false

pkgname=matlab
# install dir
_instdir="/opt/${pkgname}"
pkgver=9.4.0.813654
pkgrel=2
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
         'python2'
         'qt5-svg'
         'qt5-webkit'
         'qt5-websockets'
         'qt5-x11extras'
         'xerces-c')
optdepends=('gcc6: For MEX support')

source=("file://matlab.tar"
		"file://matlab.fik"
		"file://matlab.lic"
		"matlab.png::https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png")
md5sums=('SKIP'
		'SKIP'
		'SKIP'
		'cf28632239db6e02bc09bcca6bf5360f')
PKGEXT='.pkg.tar'

prepare() {
	# using system's libstdc++
	# using system's libfreetype for CJK font
	msg2 'Creating desktop file'
	gendesk -f -n --pkgname "${pkgname}" \
		--pkgdesc "${pkgdesc}" \
		--categories "Development;Education;Science;Mathematics;IDE" \
	        --exec 'env LD_PRELOAD=/usr/lib/libfreetype.so.6:/usr/lib/libstdc++.so.6 /opt/matlab/bin/matlab -desktop'

	msg2 'Extracting file installation key'
	_fik=$(grep -o [0-9-]* ${pkgname}.fik)

	msg2 'Modifying the installer settings'
	sed -i "s,^# destinationFolder=,destinationFolder=${pkgdir}/${_instdir}," "${srcdir}/${pkgname}/installer_input.txt"
	sed -i "s,^# agreeToLicense=,agreeToLicense=yes," "${srcdir}/${pkgname}/installer_input.txt"
	sed -i "s,^# mode=,mode=silent," "${srcdir}/${pkgname}/installer_input.txt"
	sed -i "s,^# fileInstallationKey=,fileInstallationKey=${_fik}," "${srcdir}/${pkgname}/installer_input.txt"

	if ${_networkinstall}; then
		sed -i "s,^# licensePath=,licensePath=${srcdir}/matlab.lic," "${srcdir}/${pkgname}/installer_input.txt"
	else
		sed -i "s,^# activationPropertiesFile=,activationPropertiesFile=${srcdir}/${pkgname}/activate.ini," "${srcdir}/${pkgname}/installer_input.txt"
		sed -i "s,^activateCommand=,activateCommand=activateOffline," "${srcdir}/${pkgname}/activate.ini"
		sed -i "s,^licenseFile=,licenseFile=${srcdir}/matlab.lic," "${srcdir}/${pkgname}/activate.ini"
	fi

	if [ ! -z ${_products+isSet} ]; then
    	msg2 'Building a package with a subset of the licensed products.'
    	for _product in "${_products[@]}"; do
      		sed -i "/^#product.${_product}$/ s/^#//" "${srcdir}/${pkgname}/installer_input.txt"
    	done
  	fi
}

package() {
	msg2 'Starting MATLAB installer'
	"${srcdir}/${pkgname}/install" -inputFile "${srcdir}/${pkgname}/installer_input.txt"

	msg2 'Installing license'
	install -D -m644 "${srcdir}/${pkgname}/license_agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	msg2 'Installing desktop files'
	install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

if ${_partialinstall} && [ -z ${_products+isSet} ]; then
	_products=(
		"Aerospace_Blockset"
		"Aerospace_Toolbox"
		"Antenna_Toolbox"
		"Audio_System_Toolbox"
		"Automated_Driving_System_Toolbox"
		"Bioinformatics_Toolbox"
		"Communications_System_Toolbox"
		"Computer_Vision_System_Toolbox"
		"Control_System_Toolbox"
		"Curve_Fitting_Toolbox"
		"DO_Qualification_Kit"
		"DSP_System_Toolbox"
		"Data_Acquisition_Toolbox"
		"Database_Toolbox"
		"Datafeed_Toolbox"
		"Econometrics_Toolbox"
		"Embedded_Coder"
		"Filter_Design_HDL_Coder"
		"Financial_Instruments_Toolbox"
		"Financial_Toolbox"
		"Fixed_Point_Designer"
		"Fuzzy_Logic_Toolbox"
		"GPU_Coder"
		"Global_Optimization_Toolbox"
		"HDL_Coder"
		"HDL_Verifier"
		"IEC_Certification_Kit"
		"Image_Acquisition_Toolbox"
		"Image_Processing_Toolbox"
		"Instrument_Control_Toolbox"
		"LTE_HDL_Toolbox"
		"LTE_System_Toolbox"
		"MATLAB"
		"MATLAB_Coder"
		"MATLAB_Compiler"
		"MATLAB_Compiler_SDK"
		"MATLAB_Distributed_Computing_Server"
		"MATLAB_Production_Server"
		"MATLAB_Report_Generator"
		"Mapping_Toolbox"
		"Model_Predictive_Control_Toolbox"
		"Model_Based_Calibration_Toolbox"
		"Neural_Network_Toolbox"
		"OPC_Toolbox"
		"Optimization_Toolbox"
		"Parallel_Computing_Toolbox"
		"Partial_Differential_Equation_Toolbox"
		"Phased_Array_System_Toolbox"
		"Polyspace_Bug_Finder"
		"Polyspace_Code_Prover"
		"Powertrain_Blockset"
		"Predictive_Maintenance_Toolbox"
		"RF_Blockset"
		"RF_Toolbox"
		"Risk_Management_Toolbox"
		"Robotics_System_Toolbox"
		"Robust_Control_Toolbox"
		"Signal_Processing_Toolbox"
		"SimBiology"
		"SimEvents"
		"Simscape"
		"Simscape_Driveline"
		"Simscape_Electronics"
		"Simscape_Fluids"
		"Simscape_Multibody"
		"Simscape_Power_Systems"
		"Simulink"
		"Simulink_3D_Animation"
		"Simulink_Check"
		"Simulink_Code_Inspector"
		"Simulink_Coder"
		"Simulink_Control_Design"
		"Simulink_Coverage"
		"Simulink_Design_Optimization"
		"Simulink_Design_Verifier"
		"Simulink_Desktop_Real_Time"
		"Simulink_PLC_Coder"
		"Simulink_Real_Time"
		"Simulink_Report_Generator"
		"Simulink_Requirements"
		"Simulink_Test"
		"Spreadsheet_Link"
		"Stateflow"
		"Statistics_and_Machine_Learning_Toolbox"
		"Symbolic_Math_Toolbox"
		"System_Identification_Toolbox"
		"Text_Analytics_Toolbox"
		"Trading_Toolbox"
		"Vehicle_Dynamics_Blockset"
		"Vehicle_Network_Toolbox"
		"Vision_HDL_Toolbox"
		"WLAN_System_Toolbox"
		"Wavelet_Toolbox"
		)
fi
