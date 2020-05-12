public final class JREMajorVersion {

  private static final String bugLink =
    "Please report this as a bug to https://aur.archlinux.org/packages/metals/";

  private static String getMajorVersion() {
    final String javaVersion = System.getProperty("java.version");
    if (javaVersion == null) {
      throw new AssertionError("System property \"java.version\" is null. " + JREMajorVersion.bugLink);
    } else {
      final String[] javaVersionComponents = javaVersion.split("\\.");
      if (javaVersionComponents.length < 2) {
        throw new AssertionError("Unable to determine Java version because System property \"java.version\" has < 2 components. Value found: " + javaVersion + ". " + JREMajorVersion.bugLink);
      } else {
        if (javaVersionComponents[0].equals("1")) {
          return javaVersionComponents[1];
        } else {
          return javaVersionComponents[0];
        }
      }
    }
  }

  public static void main(final String[] args) {
    System.out.println(JREMajorVersion.getMajorVersion());
  }
}
