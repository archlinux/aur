# Maintainer:  Alexei Colin <ac at alexeicolin dot com>

# NOTE: GUI is needed to run this, because top-level installer does not forward
# '--unattended" to the nested installers it invokes, hence those installers
# generate a GUI box. Parent installer fails if run headless.

pkgname=ti-ble-sdk
pkgver=2.02.04.06
_pkgver=2_02_04_06
pkgrel=1
pkgdesc="Texas Instruments BLE Stack for CC2640/CC2650/CC1350"
arch=('x86_64')
url="http://www.ti.com/tool/ble-stack"
license=('custom:LPRF')

makedepends=('wine')
depends=('python2-lxml' 'ti-rtos-cc13xx-cc26xx')
optdepends=('ccstudio' 'ti-cgt-arm')
install=$pkgname.install

_bundle=ble_sdk_${_pkgver}
_installer=${_bundle}_setup.exe

# Alternatively, to download from TI, you need a download key, which
# you can get by following the $url link above and clicking through
# _key=

source=(# Requires you to open "$url" in browser to get download link with key
	#"https://downloads.ti.com/downloads/simplelink/esd/ble_sdk/${_installer}?__gda__=${_key}"
        local://${_installer}
	ltoa.patch)

options=(!strip libtool staticlibs emptydirs !purge !zipman)

_winedir=wine

# install into CCS parent directory for CCS to find it automatically
_ccsdir=ccstudio
_destdir=opt
_installdir=installdir
_installpath=$_installdir/$_destdir/$_ccsdir

build() {
    cd $srcdir

    echo ">>> Running Windows installer via wine. When prompted:"
    echo ">>>    * CANCEL installation of Mono for .NET Framework (not needed)"
    echo ">>>    * CANCEL installation of Gecko (not needed)"
    echo ">>>    * CANCEL the install of TI RTOS (it was installed automatically as a package dependency)"
    echo ">>>    * IGNORE error about dotNetFx"

    WINEPREFIX=$srcdir/$_winedir wine $srcdir/${_installer} \
        --mode unattended --prefix $srcdir/${_installpath} 1> wine.log 2>&1
}

_run() {
    echo "$@"
    "$@"
}

# Credit: https://github.com/jcormier/TI_BLE_CC2650_Linux_Convert
function _replace_text_in_ble_sdk {
    _from="$1"
    _to="$2"
    shift
    shift
    echo -e "Changing $_from to $_to in all ble_sdk source files"
    echo grep --exclude-dir=".git" --exclude=*.a "$@" -rl "$_from" "${_installpath}" \| xargs sed -i "s#$_from#$_to#g"
         grep --exclude-dir=".git" --exclude=*.a "$@" -rl "$_from" "${_installpath}"  | xargs sed -i "s#$_from#$_to#g"
}

package() {
    cd $srcdir

    # Fix paths (case, etc). Credit: https://github.com/jcormier/TI_BLE_CC2650_Linux_Convert

    # There's an invalid linked location in ${_installpath}/examples/cc2650stk/sensortag_lcd/ccs/app/.project
    # This is a best guess at what's intended.
    #_replace_text_in_ble_sdk "SRC_COMMON/hal/src/target/_common/board.h" "SRC_EX/target/Board.h"

    # Use Board.h consistently in the ble stack instead of a mixture of board.h and Board.h.
    # The tirtos uses Board.h consistently so we'll assume that's correct.
    _replace_text_in_ble_sdk "\\\"board\\.h" "\\\"Board.h"
    _replace_text_in_ble_sdk "\\/board\\.h" "\\/Board.h"
    #_replace_text_in_ble_sdk "<board\\.h" "<Board.h"

    # We have to rename some files in the ble stack for this to work.
    echo find ${_installpath} -name "board\.h" \| sed -e "p;s/board.h/Board.h/" \| xargs -n2 mv
         find ${_installpath} -name "board\.h"  | sed -e "p;s/board.h/Board.h/"  | xargs -n2 mv

    # Fix a few places where the include directives or references don't match the file's case.
    _replace_text_in_ble_sdk "DisplayUART\\.h" "DisplayUart.h"
    _replace_text_in_ble_sdk "DisplayUART\\.c" "DisplayUart.c"
    _replace_text_in_ble_sdk "hal_UART\\.h" "hal_uart.h"
    _replace_text_in_ble_sdk "ICall\\.h" "icall.h"
    _replace_text_in_ble_sdk "OSAL\\.h" "osal.h"
    _replace_text_in_ble_sdk "OSAL_Tasks\\.h" "osal_tasks.h"
    _replace_text_in_ble_sdk "OSAL_Memory\\.h" "osal_memory.h"
    _replace_text_in_ble_sdk "OSAL_Timers\\.h" "osal_timers.h"
    _replace_text_in_ble_sdk "ti/drivers/rf/rf.h" "ti/drivers/rf/RF.h"
    _replace_text_in_ble_sdk "sensorTag\\.h" "sensortag.h"
    _replace_text_in_ble_sdk "sensortag_Display\\.h" "sensortag_display.h"
    _replace_text_in_ble_sdk "npi_tl_SPI\\.c" "npi_tl_spi.c"
    _replace_text_in_ble_sdk "npi_tl_SPI\\.h" "npi_tl_spi.h"
    _replace_text_in_ble_sdk "npi_tl_UART\\.c" "npi_tl_uart.c"
    _replace_text_in_ble_sdk "npi_tl_UART\\.h" "npi_tl_uart.h"
    _replace_text_in_ble_sdk "bsp_SPI\\.c" "bsp_spi.c"
    _replace_text_in_ble_sdk "bsp_SPI\\.h" "bsp_spi.h"

    # The case of driverlib needs to be fixed in both the BLE SDK and the TIRTOS sources
    _replace_text_in_ble_sdk "driverLib/timer.h" "driverlib/timer.h"
    #_replace_text_in_tirtos "driverLib\\/timer.h" "driverlib\\/timer.h"

    # Fix absolute Windows paths set for a default wine install by using paths relative to the imported project
    _replace_text_in_ble_sdk "file:/C:/ti" "\$\{PARENT-6-ORG_PROJ_DIR\}"

    # Some references are broken.  This might be caused by copying to the workspace when importing the projects.
    #_replace_text_in_ble_sdk "PARENT-5-PROJECT_LOC/src/examples/sensortag" "SRC_EX/examples/sensortag"
    #_replace_text_in_ble_sdk "PARENT-5-PROJECT_LOC/src/profiles/sensor_profile" "SRC_EX/profiles/sensor_profile"
    #_replace_text_in_ble_sdk "PARENT-1-PROJECT_LOC/config/" "PARENT-2-ORG_PROJ_DIR/ccs/config/"

    # Need forward slashes rather than backslashes in library paths.  One is wrong, all the others look OK.
    #_replace_text_in_ble_sdk "\\\\rom\\\\enc_lib\\\\cc26xx_ecc_rom_api.a" "/rom/enc_lib/cc26xx_ecc_rom_api.a"

    # Running the Windows lib_search executable under wine generates absolute paths with a Z: prefix, so run the python
    # source directly.  Also change backslashes to forward slashes in the searchpath elements that this application uses.
    _replace_text_in_ble_sdk "&quot;\\\${TOOLS_BLE}/lib_search/lib_search.exe" "python \\&quot;\\\${TOOLS_BLE}/lib_search/src/lib_search.py"
    _replace_text_in_ble_sdk "\\\${TOOLS_BLE}/frontier/frontier.exe" "python \\\${TOOLS_BLE}/frontier\\/src/frontier.py"
    _run sed -i "/searchpath/s/\\\\/\\//g"  ${_installpath}/${_bundle}/tools/lib_search/params_split_cc2640.xml
    #_run sed -i "/searchpath/s/\\\\/\\//g"  ${_installpath}/${_bundle}/tools/lib_search/params_split_cc1350.xml

    # Build hooks call python scripts using 'python x.py' command, but scripts are Python v2
    _replace_text_in_ble_sdk "python " "python2 " --include ".cproject"

    # Patch that makes the example projects importable and buildable:
    # * lets the imported copy build without it attempting to modify the source copy
    #   (which is owned by root).
    # * fixes refs to files generated by 'stack' project from 'app' project

    _replace_text_in_ble_sdk "PARENT-2-ORG_PROJ_DIR/ccs/config/lib_linker.cmd" "PROJECT_LOC/lib_linker.cmd" --include ".project"
    _replace_text_in_ble_sdk "\${ORG_PROJ_DIR}[^\" ]\+lib_linker.cmd" "\${PROJECT_LOC}/lib_linker.cmd" --include ".cproject"

    # This one fixes a cryptic error from XDC:
    #   js: "/opt/ccstudio/xdctools_3_32_00_06_core/packages/xdc/template.xs",
    #   line 55: TypeError: # xdc.services.intern.xsr.Value$Obj@a9b3b0c::xdc.runtime.Error is not a function, it is object.
    _xdcmatch='<tool id="com.ti.rtsc.buildDefinitions.XDC_[0-9.]\+.tool.[0-9]\+" name="XDCtools" superClass="com.ti.rtsc.buildDefinitions.XDC_[0-9.]\+.tool">'
    _xdcinsert='<option id="com.ti.rtsc.buildDefinitions.XDC_3.16.tool.JAVA_PROPERTIES.1282003423" superClass="com.ti.rtsc.buildDefinitions.XDC_3.16.tool.JAVA_PROPERTIES" valueType="stringList"> ><listOptionValue builtIn="false" value="xdc.cfg.SourceDir.outputDir=&quot;.&quot;"/> ></option>'
    for _f in $(find ${_installpath}/${_bundle}/examples -path '*ccs/app/.cproject')
    do
        _run sed -i "/$_xdcmatch/a $_xdcinsert" $_f
    done

    # There is a chicken-and-egg problem: stack project link command includes
    # the .cmd file that is generated by a post-build step of the same stack
    # project. Second issue is that in the original examples directory these
    # files are stored outside of either project in a "shared" config/ dir. We
    # need to copy the files into the stack project, and also change the paths
    # to them in the .[c]project files, so that these files are copied when the
    # project is imported into a workspace.

    _autogened="ccs_linker_defines.cmd ccs_compiler_defines.bcfg"

    for _f in $_autogened
    do
        for _e in $(find ${_installpath}/${_bundle}/examples -path '*ccs/stack/.project')
        do
            _run cp $(dirname $_e)/../config/$_f $(dirname $_e)
        done
    done

    for _f in $_autogened lib_linker.cmd
    do
        for _e in $(find ${_installpath}/${_bundle}/examples -path '*ccs/stack/.cproject')
        do
            _run sed -i "s#\${ORG_PROJ_DIR}/../../ccs/config/$_f#\${PROJECT_LOC}/$_f#g" $_e
        done
        for _e in $(find ${_installpath}/${_bundle}/examples -path '*ccs/stack/.project')
        do
            _run sed -i "s#PARENT-2-ORG_PROJ_DIR/ccs/config/$_f#PROJECT_LOC/$_f#g" $_e
        done
        for _e in $(find ${_installpath}/${_bundle}/examples -path '*ccs/app/.project')
        do
            _board="$(echo $_e | cut -d '/' -f 6)"
            _app="$(echo $_e | cut -d '/' -f 7)"
            _run sed -i "s#PARENT-2-ORG_PROJ_DIR/ccs/config/$_f#PARENT-1-PROJECT_LOC/${_app}_${_board}_stack/$_f#g" $_e
        done
    done

    # TI ARM CGT 19.6.0.STS changed the ltoa prototype
    # See TI Incident Report SDSCM00052006:
    # https://cqweb.ext.ti.com/cqweb/restapi/SDO-Web/SDOWP/RECORD/SDSCM00052006?format=HTML&noframes=true&recordType=IncidentReport&loginId=readonly&password=readonly
    # Reported: https://e2e.ti.com/support/wireless-connectivity/bluetooth/f/538/t/835138
    patch -d ${_installpath}/${_bundle} -p1 < $srcdir/ltoa.patch

    cp -al $srcdir/${_installdir}/${_destdir} $pkgdir

    install -D -m0644 $srcdir/${_installpath}/${_bundle}/license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('80173b0c95f31cc2a80b7c238eef7083b3e4b8d2ce6f00282cf455b22ce1c7cf'
            '675fd1fcd998eb17726210540d5ce3e0061b84defba1b246e7a720e2de1f463e')
