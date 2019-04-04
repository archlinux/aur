#! /bin/bash
#  (GPL3+) Alberto Salvia Novella (es20490446e.wordpress.com)


mainFunction () {
	updateInfoFile
	buildPackage
}


buildPackage () {
	removeBuildFiles
	echoOnError "buildPackage" "makepkg --force"
	removeBuildFiles
}


changeToThisProgramDir () {
	cd "$( dirname "${BASH_SOURCE[0]}" )"
}


echoOnError () {
	function="${1}"
	command="${2}"
    error=$(eval "${command}" 2>&1 >"/dev/null")

    if [ ${?} -ne 0 ]; then
        echo "${function}: ${error}" >&2
        exit 1
    fi
}


removeBuildFiles () {
	name=$(variableInFile "Name" "PKGBUILD")
	folders="pkg src ${name}"
	echoOnError "removeBuildFiles" "rm --recursive --force ${folders}"
}


updateInfoFile () {
	echoOnError "updateInfoFile" "makepkg --printsrcinfo > .SRCINFO"
}


variableInFile () {
	variable="${1}"
	file="${2}"

	echo $(
		source "${file}";
		eval echo \$\{${variable}\}
	)
}


changeToThisProgramDir
mainFunction
