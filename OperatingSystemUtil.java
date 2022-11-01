package de.bookman.util;

import java.io.File;

public class OperatingSystemUtil {
    public OperatingSystemUtil() {
    }

    public static File getTempDir() {
        return new File(System.getProperty("java.io.tmpdir"));
    }

    public static boolean jvmIs64Bit() {
        return System.getProperty("sun.arch.data.model").equals("64");
    }

    public static boolean isLinux() {
        return false;
    }

    public static boolean isWindows() {
        return false;
    }

    public static boolean isMacOSX() {
        return true;
    }
}

