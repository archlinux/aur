public final class JREMajorVersion {

  private static final String bugLink =
    "Please report this as a bug to https://aur.archlinux.org/packages/metals/";

  private static String getMajorVersion() {
    final String javaVersion = System.getProperty("java.version");
    if (javaVersion == null) {
      throw new AssertionError("System property \"java.version\" is null. " + JREMajorVersion.bugLink);
    } else {
      final String[] javaVersionComponents = javaVersion.split("\\.");
      if (javaVersionComponents.length < 1) {
        // In this case there is no '.' in the version number, e.g. it
        // is "15"
        return javaVersion;
      } else if (javaVersionComponents[0].equals("1")) {
        // Probably using the older version number scheme,
        // e.g. "1.8.0"
        return javaVersionComponents[1];
      } else {
        return javaVersionComponents[0];
      }
    }
  }

  public static void main(final String[] args) {
    System.out.println(JREMajorVersion.getMajorVersion());
  }
}
